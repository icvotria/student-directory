def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.gsub(/[A-Za-z']+/,&:capitalize)
  puts "What cohort is #{name} in?"
  cohort = gets.chomp.capitalize
  # while name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    students.count > 1 ? (puts "Now we have #{students.count} students.") : (puts "Now we have #{students.count} student.")
    # get another name from the user
    puts "Please enter another student, or press return to stop."
    name = gets.chomp.gsub(/[A-Za-z']+/,&:capitalize)
    break if name.empty?
    puts "What cohort is #{name} in?"
    cohort = gets.chomp.capitalize
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
    puts students[count][:name]
    count += 1
  end
end

def print_footer(students)
  puts "-------------".center(100)
  puts "Overall, we have #{students.count} great students."
end

def first_letter(students)
  puts "-------------".center(100)
  puts "What letter would you like to look up?"
  letter = gets.chomp.upcase
  letter_array = []
  students.each do |student|
    student[:name].chars[0] == letter ? letter_array.push(student[:name]) : next
  end
  if letter_array.empty?
    puts "There are no students whose name starts with #{letter}."
  elsif letter_array.size == 1
    puts "The student whose name starts with #{letter} is:"
    puts "#{letter_array.join}"
  else
    puts "The students whose names start with #{letter} are:"
    puts "#{letter_array.join("\n")}"
  end
end

def short_names(students)
  puts "-------------".center(100)
  puts "The students whose names are less than 12 characters long are:"
  students.each do |student|
    student[:name].length < 12 ? (puts "#{student[:name]}") : next
  end
end

def details_input(students)
  puts "-------------".center(100)
  students.each do |student|
    puts "What is #{student[:name]}'s hobby?"
    hobby = gets.chomp.gsub(/[A-Za-z']+/,&:capitalize)
    student[:hobby] = hobby
  end
  puts "-------------".center(100)
  students.each do |student|
    puts "What is #{student[:name]}'s favourite film?"
    fav_film = gets.chomp.gsub(/[A-Za-z']+/,&:capitalize)
    student[:fav_film] = fav_film
  end
end

def details_getter(students)
  puts "-------------".center(100)
  puts "What would you like to learn about the students, their hobbies or their favourite films?"
  answer = gets.chomp
  case answer
  when "hobbies"
    students.each do |student|
    puts "#{student[:name]}: #{student[:hobby]}"
    end
  when "favourite films"
    students.each do |student|
    puts "#{student[:name]}: #{student[:fav_film]}"
    end
  end
end
students = input_students
print_header
print(students)
print_footer(students)
first_letter(students)
short_names(students)
details_input(students)
details_getter(students)