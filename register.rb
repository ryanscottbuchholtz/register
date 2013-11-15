time = Time.new
 
puts 'What is the amount due?'
amount_due = gets.to_f
puts ''
 
amount_due_decimal_too_many = amount_due.to_s.split('.').last
 
if amount_due_decimal_too_many.length >2
puts "WARNING! Invalid currency detected! Exiting..."
 
elsif amount_due.to_f.to_i == 0 && amount_due <= 0
puts "WARNING! Invalid currency detected! Exiting..."
 
else
 
puts 'What is the amount tendered?'
amount_tendered = gets.to_f
puts ''

amount_tendered_decimal_too_many = amount_tendered.to_s.split('.').last

if amount_tendered_decimal_too_many.length >2
puts "WARNING! Invalid currenct detected!  Exiting..."

else
 
cust_short = amount_due - amount_tendered
cust_short = format("$%.2f",cust_short)
 
cust_change = amount_tendered - amount_due
cust_change = format("$%.2f",cust_change)

if amount_tendered < amount_due
puts "WARNING: Customer still owes #{cust_short}. Exiting..."
puts''
 
elsif amount_tendered > amount_due
puts ''
puts "===Thank you!==="
puts ''
puts "The total change due is #{cust_change}"
puts ''
puts time.strftime("%a %b %d, %Y %I:%M:%S %p")
puts "==============="
 
elsif amount_tendered = amount_due
puts ''
puts "===Thank you!==="
puts ''
puts "Exact change tendered."
puts ''
puts time.strftime("%a %b %d, %Y %I:%M:%S %p")
puts "==============="
 
end
end
end
