def input_students
  puts "Please enter the names of the students, hobbies, height and countries of birth"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp()
  # Added hobby, country & height variables to store additional input
  hobby = gets.chomp()
  height = gets.chomp()
  country = gets.chomp()
  

  while !name.empty? do
    students << {name: name, hobby: hobby, country: country, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    # Added hobby, country & height variables to store additional input
    hobby = gets.chomp()
    height = gets.chomp()
    country = gets.chomp()
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header

  hash = students[0]
  count = 0
  length = students.length

while count < length do
  # Added hobby, country & height to be printed out with each student
  puts "#{hash[:name]} #{hash[:hobby]} #{hash[:height]} #{hash[:country]} (#{hash[:cohort]} cohort)"
  count += 1
  hash = students[count]
end

print_footer(students)
