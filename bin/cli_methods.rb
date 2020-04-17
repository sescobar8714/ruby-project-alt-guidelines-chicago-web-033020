# def clear_screen
#     puts "Press any key to go back to the menu"
#     gets.chomp
#     puts "\e[H\e[2J"
# end
def title
puts"██████   ██████  ██████  ██████   █████           ██ ██    ██ ██      ██  ██████  ███████     ██████  ██ ███████ ███████  █████      ███████ ██   ██  ██████  ██████  
██   ██ ██    ██ ██   ██ ██   ██ ██   ██          ██ ██    ██ ██      ██ ██    ██ ██          ██   ██ ██    ███     ███  ██   ██     ██      ██   ██ ██    ██ ██   ██ 
██████  ██    ██ ██████  ██████  ███████          ██ ██    ██ ██      ██ ██    ██ ███████     ██████  ██   ███     ███   ███████     ███████ ███████ ██    ██ ██████  
██      ██    ██ ██      ██      ██   ██     ██   ██ ██    ██ ██      ██ ██    ██      ██     ██      ██  ███     ███    ██   ██          ██ ██   ██ ██    ██ ██      
██       ██████  ██      ██      ██   ██      █████   ██████  ███████ ██  ██████  ███████     ██      ██ ███████ ███████ ██   ██     ███████ ██   ██  ██████  ██      
                                                                                                                                                                      
                                                                                                                                                                      "

end 

def display_menu_options
    puts"**********************************************************************************************************************************************************************************"
    title
    puts "                                                            Please choose your selection:                                                                                             "
    puts "                                                             1: Create An Order                                                                                                       "
    puts "                                                             2: See An Order"
    puts "                                                             3: Update An Order"
    puts "                                                             4: Delete An Order"
    puts "                                                            Exit: To Exit Program"
    puts "*********************************************************************************************************************************************************************************"

end

def clear_screen
    gets.chomp
    puts "\e[H\e[2J"
end

# def create_customer(customer_name)
#     puts "Please Enter Your Name:"
#     customer_name = gets.chomp
#     puts "#{customer_name}? Is This Correct"
#     response = gets.chomp
#     if response == "yes"
#         customer_name = Customer.create(name: customer_name)
#         puts "Hi #{customer_name.to_s}! Press Enter Key To Continue!"
#         customer_name
#     elsif response == "no"
#         puts "Press Enter Key To Go Back"
#         gets.chomp
#     else
#         puts "Error! Press Enter To Escape!"
#         gets.chomp
#     end 
# end 

def assign_chef(random_chef)
    random_chef = Chef.all.sample
    random_chef
end

def create_order
    puts "Please Enter Your Name:"
    customer_name = gets.chomp
    puts "#{customer_name}? Is This Correct"
    response = gets.chomp
    if response == "yes"
        customer_name = Customer.create(name: customer_name)
        puts "Hi #{customer_name.to_s}! Press Enter Key To Continue!"
    elsif response == "no"
        puts "Press Enter Key To Go Back"
        clear_screen
        create_order 
    else
        puts "Error! Press Enter To Escape!"
        gets.chomp
    end 
    # customer_name = create_customer(customer_name)
    clear_screen
    #CreateOrder
    puts "Let's Make Some Pizza! What Would You like?"
    pizza_order = gets.chomp
    puts "So you ordered a #{pizza_order} pizza?"
    response = gets.chomp
    if response == "yes" 
        pizza_order = Order.create(pizza_order: pizza_order)
        #AssignChef
        random_chef = Chef.all.sample
        #CreateOrder
        random_chef.orders << pizza_order
        customer_name.orders << pizza_order
        puts "Thank you for your order! Press Enter Key To See Your Order Id!"
        clear_screen
        puts "------------------"
        puts "Thanks #{customer_name.to_s}"
        puts "Here's Your Order: #{pizza_order.to_s}"
        puts "Here's Your Chef: #{random_chef.to_s}"
        puts "Press Enter Key To Exit!"
        puts "------------------"
        gets.chomp
    elsif response == "no" 
        puts "Press Enter Key To Go Back To Menu"
        gets.chomp
        display_menu_options
    else
        puts "Press Enter Key To Go Back To Menu"
        gets.chomp
        display_menu_options
    end
end

def see_order
   puts "------------"
   puts " Please Input Order ID "
   puts "---------------"
   order_id = gets.chomp
if Order.exists?(id: order_id) == true
    found_order = Order.find(order_id)
        puts "----------------"
        puts "Hey! #{found_order.customer.name}"
        puts found_order.to_s
        puts "----------------"
        gets.chomp
else
        puts "Sorry I Didnt Get That! Try Again!"
        gets.chomp
   end
end 


def update_order
   puts Order.all
   puts "------------"
   puts "Please Input Order ID"
   puts "---------------"
   order_id = gets.chomp
   
   if Order.exists?(id: order_id) == true
        found_order = Order.find(order_id)
        puts "----------------"
        puts found_order.to_s
    puts "----------------"
    gets.chomp
    else
    puts "Sorry I Didnt Get That! Try Again!"
    gets.chomp
    update_order
    end
   
    puts "What Would Be Your New Order:"
   new_order = gets.chomp 
   puts "So Your New Order Is A #{new_order} Pizza?"
   response = gets.chomp
    
   if response == "yes"
        found_order.update(pizza_order:new_order)
        found_order.save
        puts found_order.to_s
        puts "Thank you!! Press Any Key To Go Back To The Menu!"
        gets.chomp
    elsif response == "no"
        puts "Lets Try Again By Pressing Enter Key!"
        gets.chomp
        update_order
    else
        puts "Didnt Get That? Lets Try Again By Pressing Enter!"
        gets.chomp 
        update_order
        end
    end

def delete_order
   puts "---------------------"
   puts "Please Input Order ID"
   puts "---------------------"
   order_id = gets.chomp
if Order.exists?(id: order_id) == true
    found_order = Order.find(order_id)
    puts "----------------"
    puts found_order.to_s
    puts "----------------"
    gets.chomp
else
    puts "Sorry I Didnt Get That! Press Enter!"
    gets.chomp
end
    puts "Do You Want To Delete An Order?"
    response = gets.chomp
if response == "yes"
    found_order.delete
    puts "POOF! All Gone! Press Enter Key To Head Back To The Menu!"
    gets.chomp
elsif response == "no"
    puts "Press Enter To Go Back!" 
    gets.chomp
else
    puts "Press Enter To Go Back!"
    gets.chomp
    end
       
end