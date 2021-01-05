require_relative 'api.rb'
require_relative 'stock.rb'

class CLI

    @@current_ticker = ""

    #method that behaves as entry point to cli
    def start
        puts "Welcome to Stock Info!"
        puts "Please enter a ticker symbol to see basic information about the stock."
        ticker = user_input.upcase

        stock_exists?(ticker)

        puts "What would you like to do next? Type 'ls' for a list of additional information regarding the current stock. Type 'new' to enter a new ticker symbol to search for or 'q' to quit."
        menu
    end

    def current_stock(ticker)
        stock = Stock.all.find {|stock| stock.ticker == ticker}
        @@current_ticker = ticker
        stock
    end

    def stock_exists?(ticker)
        if current_stock(ticker) != nil
            display_info(current_stock(ticker))
        else
            API.get_info(ticker)
            display_info(current_stock(ticker))
        end
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
        puts "Please enter a new ticker symbol."
        ticker = user_input.upcase
        stock_exists?(ticker)
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
            puts "Sector:\n#{current_stock(@@current_ticker).sector}"
            puts ""
        when 2
            puts ""
            puts "City:\n#{current_stock(@@current_ticker).city}"
            puts ""
            puts "Country:\n#{current_stock(@@current_ticker).country}"
            puts ""
        when 3
            puts ""
            puts "Website:\n#{current_stock(@@current_ticker).website}"
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
            # binding.pry
        elsif selection == 'q'
            #quit program
            exit_program
        else
            invalid
        end
    end
end