require 'pry'
require 'rainbow'


puts Rainbow("Welcome to MTA Planner").underline.bright

# Inputs from traveller, create methods for each value so it can be used globally
def starting_station
  print Rainbow("Enter your starting station: ").bright
  gets.chomp.to_s # starting station
end

starting_station

# def starting_line
#   print Rainbow("Enter the line of your starting station: ").bright
#   gets.chomp.to_s # starting line
# end
# starting_line
#
# def final_station
#   print Rainbow("Enter your final station: ").bright
#   gets.chomp.to_s # final station
# end
# final_station
#
# def final_line
#   print Rainbow("Enter the line of your final station: ").bright
#   gets.chomp.to_s
# end
# final_line

# definition of each train line
# def mta_lines
#   {"N" => line_n , "L" => line_l, "6" => line_six} # =>   WORK ON THIS!!!
# end
# methods for each line
def line_n
  ["Times Square", "34th", "28th", "Union Square", "8th"]
end

# def line_l
#   ["8th", "6th", "Union Square", "3rd", "1st"]
# end
#
# def line_six
#   ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
# end


def get_starting_station
  # (start,start_line)
  # if start_line == "N" then
    start_index = line_n.index(starting_station) # NEED TO MAKE START.LINE KNOW WHAT "N" IS..DEFINE THAT
    puts "Index of starting station is #{start_index}"
  # elsif start_line == "L" then
  #   index = line_l.index("3rd")
  #   p index
  # else
  #   index = line_six.index("23rd")
  #   p index
  # end
  # return index
end
get_starting_station()

# start_index = get_starting_station(start,start_line)

# puts Rainbow("You will be travelling from #{starting_station} station on line #{starting_line} to #{final_station} station on line #{final_line}").green


# moving forward
#   moving forward on single line
#
# find index posiiton of starting station - in lines different then count to union square, the from union square to final destination



# def get_final_station
#   # if start_line == "N" then
#     final_index = line_n.index(final_station)
#     puts "Index of final station is #{final_index}"
#
#   # elsif start_line == "L" then
#   #   index = line_l.index("3rd")
#   #   p index
#   # else
#   #   index = line_six.index("23rd")
#   #   p index
#   # end
# end


# final route (starting from position of fisrt station and showing all stations to the position of the of the final station

# def route_line_n
#   route = line_n[get_starting_station, get_final_station - get_starting_station]
#   p route_line_n
# end
#
# route_line_n
# # create travel route on line N, using the original line N and then selecting the stations between start and final stations
# route_line_n = line_n
# while start_index <= final_index
#   p route_line_n[start_index]
#   start_index += 1
# end
