def input_students
  puts "Please enter the names of the students, hobbies, height and countries of birth"
  puts "To finish, hit return 2 times"
  students = []
  name = gets.chomp()
  hobby = gets.chomp()
  # Program will exit if return is hit twice
  exit(0) if name == '' && hobby == ''
  country = gets.chomp()
  height = gets.chomp()
  puts "Please enter the cohort"
  value = gets.chomp()
  # May is the shortes month in character length. I'm using November as a default
  value.length < 3 ? cohort = :november : cohort = value.to_sym

  while !name.empty? do
    students << {name: name, hobby: hobby, country: country, height: height, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp()
    hobby = gets.chomp()
    # Loop will be broken if the return is pressed twice
    break if name == '' && hobby == ''
    country = gets.chomp()
    height = gets.chomp()
    puts "Please enter the cohort"
    value = gets.chomp()
    value.length < 3 ? cohort = :november : cohort = value.to_sym
  end
  students
end

def print_header
  puts "The students of Villains Academy", "--------------------------------"
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
  puts "#{hash[:name].center(20)} #{hash[:hobby].to_s.center(20)} #{hash[:country].center(20)} #{hash[:height].to_s.center(20)} (#{hash[:cohort]} cohort)"
  count += 1
  hash = students[count]
end

print_footer(students)