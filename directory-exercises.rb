def input_students
  puts "Please enter the names of the students, their hobby and favourite film."
  puts "To finish, just hit return twice."
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  hobby = gets.chomp
  fav_film = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, fav_film: fav_film}
    students.count > 1 ? (puts "Now we have #{students.count} students.") : (puts "Now we have #{students.count} student.")
    # get another name from the user
    name = gets.chomp
    break if name.empty?
    hobby = gets.chomp
    fav_film = gets.chomp
  end
  # return the array of students
  students
end
  
  
def print_header
  puts "The Students of Villains Academy".center(100, " ** ")
  puts "-------------".center(100).center(100)
end

def print(students)
  count = 0
  number = students.length
  until count == number
    puts students[count][:name].capitalize
    count += 1
  end
  #students.each_with_index do |student, index|
  #  puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)"
  # end
end

def print_footer(students)
  puts "-------------".center(100)
  puts "Overall, we have #{students.count} great students."
end

def first_letter(students)
  puts "-------------".center(100)
  puts "What letter would you like to look up?"
  letter = gets.chomp.downcase
  letter_array = []
  students.each do |student|
    student[:name].chars[0] == letter ? letter_array.push(student[:name].capitalize) : next
  end
  if letter_array.empty?
    puts "There are no students whose name starts with #{letter.upcase}."
  elsif letter_array.size == 1
    puts "The student whose name starts with #{letter.upcase} is:"
    puts "#{letter_array}"
  else
    puts "The students whose names start with #{letter.upcase} are:"
    puts "#{letter_array}"
  end
end

def short_names(students)
  puts "-------------".center(100)
  puts "The students whose names are less than 12 characters long are:"
  students.each do |student|
    student[:name].length < 12 ? (puts "#{student[:name].capitalize}") : next
  end
end

def details_getter(students)
  puts "-------------".center(100)
=begin  
  puts "-------------".center(100)
  puts "Who would you like to learn about?"
  student = gets.chomp
  if !students.include? student
    puts "#{student.capitalize} doesn't go to this school."
  else
    puts "What would you lke to know about #{student.capitalize}, their hobby or their favourite film?"
    answer = gets.chomp
    case answer
    when "hobby"
      puts "#{student.capitalize}'s hobby is #{student[:hobby].downcase}."
    when "favourite film"
      puts "#{student.capitalize}'s favourite film is #{student[:fav_film].capitalize}."
    end
  end
=end
  puts "What would you like to learn about the students, their hobbies or their favourite films?"
  answer = gets.chomp
  case answer
  when "hobbies"
    students.each do |student|
    puts "#{student[:name].capitalize}: #{student[:hobby].capitalize}"
    end
  when "favourite films"
    students.each do |student|
    puts "#{student[:name].capitalize}: #{student[:fav_film].capitalize}"
    end
  end
end
students = input_students
print_header
print(students)
print_footer(students)
first_letter(students)
short_names(students)
details_getter(students)