# Calculator
# You will be building a calculator. A calculator can perform multiple arithmetic operations. Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
# Specification:
# A user should be given a menu of operations
# A user should be able to choose from the menu
# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
# This process should continue until the user selects a quit option from the menu
# Phase 1
# Calculator functionality
# Calculator should be able to do basic arithmetic (+,-, *, /)
# Phase 2
# Advanced Calculator functionality
# Calculator should be able to do basic arithmetic (exponents, square roots)
# Bonus
# Mortgage Calculator
#
# Calculate the monthly required payment given the other variables as input (look up the necessary variables)
# BMI Calculator
#
# Calculate the body mass index (BMI) for an individual, given their height and weight
#
# Trip Calculator
# Calculate a trip time and cost given inputs for
# distance
# miles per gallon
# price per gallon
# speed in miles per hour




require 'pry' # Gives us acces to binding.pry() like debugger in JS
require 'rainbow' # allows different colours etc on the terminal to make things prettier

puts Rainbow("Welcome to our calculator").underline.bright ##using Rainbow().style for color on the console

def menu
  puts "(a) - addition"
  puts "(s) - subtraction"
  puts "(m) - multiplication"
  puts "(d) - division"
  puts "(r) - remainder"
  puts "(e) - exponential"
  puts "(o) - root"
  puts "(q) - quit"
  print Rainbow("Enter your choice of calculation: ").bold.white

  gets().chomp() #Implict return
end

def add
  print Rainbow("What is your first number: ").underline.bright
  first_num = gets.to_f # convert from strign to float number (with decimals)
  print "Enter your second number: "
  second_num = gets.to_f
puts "The result is #{first_num + second_num}"
end

def subtract
  print "What is your first number: "
  first_num = gets.to_f # convert from strign to float number (with decimals)
  print "Enter your second number: "
  second_num = gets.to_f
puts "The result is #{first_num - second_num}"
end

def multiply
  print "What is your first number: "
  first_num = gets.to_f # convert from strign to float number (with decimals)
  print "Enter your second number: "
  second_num = gets.to_f
puts "The result is #{first_num * second_num}"
end

def divide
  print "What is your first number: "
  first_num = gets.to_f # convert from strign to float number (with decimals)
  print "Enter your second number: "
  second_num = gets.to_f
puts "The result is #{first_num / second_num}"
end

def remainder
  print "What is your first number: "
  first_num = gets.to_f # convert from strign to float number (with decimals)
  print "Enter your second number: "
  second_num = gets.to_f
puts "The result is #{first_num % second_num}"
end

def exponent
  print "What is your first number: "
  first_num = gets.to_f # convert from strign to float number (with decimals)
  print "Enter your second number: "
  second_num = gets.to_f
puts "The result is #{first_num ** second_num}"
end

def root
  print "What is your first number: "
  first_num = gets.to_f # convert from strign to float number (with decimals)
  print "Enter your second number: "
  second_num = gets.to_f
puts "The result is #{first_num ** ( 1 / second_num) }"
end


user_choice = menu() # Whatever is returned from menu will be saved here

#Keep displaying the menu till the user_choice variable stores the string "q" which implies quit
until user_choice == "q"
  puts "The current function selected is #{user_choice}"
  #When user_choice is "a", call add()
  case user_choice
  when "a" then add()
  when "s" then subtract()
  when "m" then multiply()
  when "d" then divide ()
  when "r" then remainder()
  when "e" then exponent()
  when "o" then root()
  else
    puts "This is not a valid option."
  end

  user_choice = menu()
end

puts ""
puts "Thanks for using our calculator"
