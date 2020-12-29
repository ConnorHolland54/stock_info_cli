require_relative 'api.rb'
require_relative 'stock.rb'

class CLI

    #method that behaves as entry point to cli
    def start
        puts "Welcome to Stock Info!"
        puts "Please enter a ticker symbol to see basic information about the stock."
        ticker = user_input
        API.get_info(ticker.upcase)

        #display stock info
        display_info(Stock.all.first)

        puts "What would you like to do next? Type 'ls' for a list of additional information regarding the current stock. Type 'new' to enter a new ticker symbol to search for or 'q' to quit."
        menu
    end

    def display_info(stock)
        # stock = Stock.all.first
        puts ""

        puts "-------------------"

        puts "Name: \n#{stock.short_name}"

        puts ""

        puts "Summary: \n#{stock.long_business_summary}"

        puts "-------------------"

        puts ""

    end

    def user_input
        gets.strip
    end

    def invalid
        puts "That is not a valid option, please choose again."
        menu
    end

    def exit_program
        puts "Have a great day!"
    end

    def search_again
        Stock.all.clear
        puts "Please enter a new ticker symbol."
        input = user_input
        API.get_info(input)
        display_info(Stock.all.first)
        puts "What would you like to do next? Type 'ls' for a list of additional information regarding the current stock. Type 'new' to enter a new ticker symbol to search for or 'q' to quit."
        menu
    end

    def display_list
        puts ""
        puts "1. sector\n2. location\n3. website"
        puts ""
        puts "Please select a choice by number. ex. for sector type 1"
        input = user_input
        list_info(input.to_i)
    end

    def list_info(option)
        case option
        when 1
            puts ""
            puts "Sector:\n#{Stock.all.first.sector}"
            puts ""
        when 2
            puts ""
            puts "City:\n#{Stock.all.first.city}"
            puts ""
            puts "Country:\n#{Stock.all.first.country}"
            puts ""
        when 3
            puts ""
            puts "Website:\n#{Stock.all.first.website}"
            puts ""
        end
        puts "What would you like to do next? Type 'ls' for a list of additional information regarding the current stock. Type 'new' to enter a new ticker symbol to search for or 'q' to quit."
        menu
    end
            
    def menu
        selection = user_input
        if selection == "ls"
            #show list of additional data
            display_list
        elsif selection == 'new'
            #search for a new symbol
            search_again
        elsif selection == 'q'
            #quit program
            exit_program
        else
            invalid
        end
    end
        



end