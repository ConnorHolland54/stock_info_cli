

class CLI 

    #method that behaves as entry point to cli
    def start
        puts "Welcome to Stock Info!"
        puts "Please enter a ticker symbol to see basic information about the stock."
        ticker = user_input

        #display stock info


        puts "Would you like to search another stock? Type 'y' to search for another stock or 'n' to quit."
        menu
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

    def menu
        selection = user_input
        if selection == 'y'
            #search for another stock
        elsif selection == 'n'
            #leaves the program
            exit_program
        else
            #invalid choice
            invalid
        end
    end
        



end