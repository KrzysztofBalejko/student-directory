def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
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

  # To replace .each with while I needed to:
  # convert students array to hash
  hash = students[0]
  # while loop will require a variable count
  count = 0
  # I needed to define length
  length = students.length
  # Below working while loop replacing .each method
  while count < length do
    puts "#{hash[:name]} (#{hash[:cohort]} cohort)"
    count += 1
    hash = students[count]
  end
  # I needed to call footer function from the bottom to keep the same structure
  print_footer(students)
