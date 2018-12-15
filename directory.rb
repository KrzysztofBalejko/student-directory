def input_students
  puts "Please enter the names of the students, hobbies, height and countries of birth"
  puts "To finish, hit return 2 times"
  students = []
  # Alternative to name = gets.chomp()
  name = ""
  name = name + "\r\n"
  name = gets.chop
  # --------------
  hobby = gets.chomp()
  # Code allows to exit the program in case there is no first name. Commented out to test "if" statement in grouped_by_cohort
  # exit(0) if name == '' && hobby == ''
  country = gets.chomp()
  height = gets.chomp()
  puts "Please enter the cohort"
  value = gets.chomp()
  value.length < 3 ? cohort = :november : cohort = value.to_sym

  while !name.empty? do
    students << {name: name, hobby: hobby, country: country, height: height, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp()
    hobby = gets.chomp()
    break if name == '' && hobby == ''
    country = gets.chomp()
    height = gets.chomp()
    puts "Please enter the cohort"
    value = gets.chomp()
    value.length < 3 ? cohort = :november : cohort = value.to_sym
  end
  students
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_header
  puts "The students of Villains Academy", "--------------------------------"
end

def grouped_by_cohort(students)
  # If statement will stop code from executing if there are no students in array
 if students.length > 0
  puts "Please enter cohort which should be listed"
  co = gets.chomp
  print_header
  students.collect do |item|
   if "#{item[:cohort]}" == co
      puts "#{item[:name].center(20)} #{item[:hobby].to_s.center(20)} #{item[:height].to_s.center(20)} #{item[:country].center(20)} (#{item[:cohort]} cohort)"
   end
  end
 end
end

students = input_students
grouped_by_cohort(students)
print_footer(students)