def input_students
  puts "Please enter the names of the students"
  puts "Program will print students whose name starts from 'K' and their position on the list. "
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

def print(students)
  students.each_with_index do |student, index|
    if student[:name][0] == "K" || student[:name][0] == "k"
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

