def input_students
  puts "Please enter the names of the students, hobbies, height and countries of birth"
  puts "To finish, hit return 4 times"
  students = []
  name = gets.chomp()
  hobby = gets.chomp()
  country = gets.chomp()
  height = gets.chomp()

  while !name.empty? do
    students << {name: name, hobby: hobby, country: country, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp()
    hobby = gets.chomp()
    country = gets.chomp()
    height = gets.chomp()
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
  # Added .center method to align the output
  puts "#{hash[:name].center(20)} #{hash[:hobby].to_s.center(20)} #{hash[:country].center(20)} #{hash[:height].to_s.center(20)} (#{hash[:cohort]} cohort)"
  count += 1
  hash = students[count]
end

print_footer(students)