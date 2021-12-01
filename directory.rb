@students = []

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # get the first name
  name = gets.chomp.gsub(/[A-Za-z']+/,&:capitalize)
  # while name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student."
    else 
      puts "Now we have #{@students.count} students."
    end
    # get another name from the user
    name = gets.chomp.gsub(/[A-Za-z']+/,&:capitalize)
  end
end

def interactive_menu
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      input_students
    when "2"
      print_header
      print
      print_footer
    when "9"
      exit
    else
      puts "I don't know what '#{selection}' means, please try again"
    end
  end  
end
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print
  @students.each.with_index do |student, index|
   puts "#{index + 1}. #{student[:name]} (#{student[:cohort].capitalize} cohort)"
  end
end

def print_footer
  puts "-------------"
  puts "Overall, we have #{@students.count} great students."
end

interactive_menu