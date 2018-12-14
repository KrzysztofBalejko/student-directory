def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # empty array to store student's names
  students = []
  # getting the first name 
  name = gets.chomp
  # while the name is not empty below code will be executed 
  while !name.empty? do
    # adds the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    name = gets.chomp
  end
  # returns the array of names entered
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

