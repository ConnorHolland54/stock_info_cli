require_relative 'api.rb'
require_relative 'stock.rb'

class CLI <  API

    #method that behaves as entry point to cli
    def start
        puts "Welcome to Stock Info!"
        puts "Please enter a ticker symbol to see basic information about the stock."
        ticker = user_input
        get_info(ticker.upcase)

        #display stock info
        display_info


        puts "Would you like to search another stock? Type a ticker symbol to search for another stock or 'n' to quit."
        menu
    end

    def display_info
        stock = Stock.all.first
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

    def search_again(selection)
        get_info(selection)
        display_info
        puts "Would you like to search another stock? Type a ticker symbol to search for another stock or 'n' to quit."
        menu
    end

    def menu
        selection = user_input
        if selection != 'n'
            search_again(selection)
        elsif selection = 'n'
            exit_program
        else
            invalid
        end
    end
        



end