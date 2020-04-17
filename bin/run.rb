require_relative '../config/environment'
require_relative 'cli_methods'
ActiveRecord::Base.logger = nil 

puts "\e[H\e[2J"
display_menu_options
user_option = gets.chomp

while user_option != "exit"
    puts "\e[H\e[2J"

    if user_option == "1"
        create_order
    elsif user_option == "2"
        see_order
    elsif user_option == "3"
        update_order
    elsif user_option == "4"
        delete_order 
    else
        nil 
    end

    puts "\e[H\e[2J"
    display_menu_options
    user_option = gets.chomp
    
end 
        







