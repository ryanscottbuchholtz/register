#User Stories

#As a clerk
#I want to enter a selection from a list
#so that a running total of items and price can be calculated

#As a clerk
#I want to end a sale using a command
#so that a tally of items purchased and subtotal is displayed

#As a clerk
#I want to enter the amount tenderedπ
#so that I can return correct change

#Acceptance Criteria

#The items and prices are displayed to the clerk with corresponding commands
#The clerk uses the appropriate command to select item
#The clerk inputs quantity of item purchased
#The clerk uses appropriate command to end transactions
#The clerk enters the amount tendered
#The clerk returns appropriate change as necessary

time = Time.new

coffee_selection = {Light: 5.00, Medium: 7.50, Bold: 9.75}
selection_light = []
selection_medium = []
selection_bold = []

puts "Welcome to James' coffee emporium!"
puts ''
puts "1) Add item - $#{coffee_selection[:Light]} - Light Bag"
puts "2) Add item - $#{coffee_selection[:Medium]} - Medium Bag"
puts "3) Add item - $#{coffee_selection[:Bold]} - Bold Bag"
puts "4) Complete Sale"
puts ''

while true
  
  count_light = selection_light.inject(0) { |result, element| result + element}
  count_medium = selection_medium.inject(0) { |result, element| result + element }
  count_bold = selection_bold.inject(0) { |result, element| result + element }

  subtotal_light = count_light * coffee_selection[:Light]
  subtotal_light_formatted = format("$%.2f", subtotal_light)
  subtotal_medium = count_medium * coffee_selection[:Medium]
  subtotal_medium_formatted = format("$%.2f", subtotal_medium)
  subtotal_bold = count_bold * coffee_selection[:Bold]
  subtotal_bold_formatted = format("$%.2f", subtotal_bold)
  subtotal = subtotal_light + subtotal_medium + subtotal_bold
  subtotal_formatted = format("$%.2f", subtotal)

  puts ''
  print "Make a selection:  "
    selection = gets.chomp.to_i
  puts ''

    if selection == 4
      
      puts "========== Sale Complete =========="
      puts "#{count_light} bags of Light Roast totalling #{subtotal_light_formatted}"
      puts "#{count_medium} bags of Medium Roast totalling #{subtotal_medium_formatted}"
      puts "#{count_bold} bags of Bold Roast totalling #{subtotal_bold_formatted}"
      puts "Sale total is #{subtotal_formatted}"
      puts "=================================="
      puts ''

      puts "What is the amount tendered?"
      puts ''
        
      amount_tendered = gets.chomp.to_f
        
      puts ''
      puts ''

        if amount_tendered < subtotal
          cust_owes = subtotal - amount_tendered                  #not graceful.  I couldn't yet figure out how to do this in-line, so multiple variables are being created. 
          cust_owes2 = format("$%.2f",cust_owes)
          puts "WARNING: Customer still owes #{cust_owes2}. Exiting..."
          puts''
          
        break
        
        elsif amount_tendered > subtotal.to_f                     #not graceful.  I couldn't yet figure out how to do this in-line, so multiple variables are being created.
          change_due = amount_tendered - subtotal
          change_due2 = format("$%.2f",change_due)
          puts ''
          puts "===Thank you!==="
          puts ''
          puts "The total change due is #{change_due2}"
          puts ''
          puts time.strftime("%a %b %d, %Y %I:%M %p")                #found on Google.  I was able to understand and manipulate so it displayed I wanted it to display.
          puts ''
          puts "==============="
          
        break
           
        elsif amount_tendered = subtotal.to_f
          puts ''
          puts "===Thank you!==="
          puts ''
          puts "Exact change tendered."
          puts ''
          puts time.strftime("%a %b %d, %Y %I:%M %p")
          puts ''
          puts "==============="

        break
        end

    elsif selection != 4
  
      puts "How many bags?"
        how_many_bags = gets.chomp.to_i
      puts ''
    end

    if selection == 1
      selection_light.push how_many_bags
      puts "Current Subtotal is: $#{subtotal}"     #I can't get the running subtotal to be accurate.  It is, however, accurate at the end!  How can this be?!
          
    elsif selection == 2
      selection_medium.push how_many_bags
      puts "Current Subtotal is: $#{subtotal}"     #I can't get the running subtotal to be accurate.  It is, however, accurate at the end!  How can this be?!

    elsif selection == 3
      selection_bold.push how_many_bags
      puts "Current Subtotal is: $#{subtotal}"     #I can't get the running subtotal to be accurate.  It is, however, accurate at the end!  How can this be?!
    
    end
end

