time=Time.new
total = []

while true
  puts ''
  puts "What is the sale price?  Simply press enter when done."
  puts ''
  item_price = gets.chomp

  total.push item_price
  total_int = total.collect{|i| i.to_f}
  total_int.delete_if {|x| x == 0}
  
  running_subtotal = total_int.inject(:+)
  running_subtotal2 = format("$%.2f",running_subtotal)

  puts ''
  puts "The subtotal is: #{running_subtotal2}"
  puts ''

    if item_price == ''
      puts "Here are your item prices:"
      puts ''
      
      puts total_int
      
      puts ''
      puts ''
      
      puts "The total due is #{running_subtotal2}."
      
      puts ''
    
      puts "What is the amount tendered?"
      puts ''
      
      amount_tendered = gets.chomp.to_f
      
      puts ''
      puts ''

    if amount_tendered < running_subtotal
      cust_owes = running_subtotal - amount_tendered
      cust_owes2 = format("$%.2f",cust_owes)
      puts "WARNING: Customer still owes #{cust_owes2}. Exiting..."
      puts''
        
        break
      
    elsif amount_tendered > running_subtotal.to_f
      change_due = amount_tendered - running_subtotal
      change_due2 = format("$%.2f",change_due)
      puts ''
      puts "===Thank you!==="
      puts ''
      puts "The total change due is #{change_due2}"
      puts ''
      puts time.strftime("%a %b %d, %Y %I:%M:%S %p")
      puts "==============="
        
        break
         
    elsif amount_tendered = running_subtotal.to_f
      puts ''
      puts "===Thank you!==="
      puts ''
      puts "Exact change tendered."
      puts ''
      puts time.strftime("%a %b %d, %Y %I:%M:%S %p")
      puts "==============="
    
        break
    end
  end
end