require 'fileutils'

# file_data.each{|x| puts x.include?('class') ? 'I found a class' : next}

# # __FILE__ keyword in ruby
# puts "The current ruby file being executed is #{__FILE__}"

puts 'Hello, this is a linter that helps you check the correct style of your JS files'
puts
current_directory = File.dirname(__FILE__)
pwd = File.expand_path(current_directory)
puts "You are in #{pwd}"
puts 
puts 'Please type or paste the path of the folder where you have the files to check'
dir_to_check = gets.chomp

until File.directory?(dir_to_check)
  puts 'That\'s not a valid directory, please try again'
  dir_to_check = gets.chomp
end
puts
puts 'Please select the file from the list below'
puts
files_arr = Dir.children(dir_to_check)
puts files_arr.select {|f| f.end_with?('.js')}
puts
selected_file = gets.chomp

until files_arr.include?(selected_file)
  puts 'Please select a file from the list'
  selected_file = gets.chomp
end
puts
file_data = []
File.foreach(dir_to_check + '/' + selected_file) { |line| file_data.push(line) }
puts file_data
