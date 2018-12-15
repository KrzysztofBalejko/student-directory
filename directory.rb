@students = []

def print_menu
  # Number of 'puts' reduced to 2 lines instead of 4
  puts "1. Input the students", "2. Show the students", "3. Save the list"
  puts "4. Load the list from file", "5. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
  # Number of 'puts' reduced to 1 one line instead of 2
  puts "Please enter the names of the students", "To finish, hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do
    student_data_base
    puts "Now we have #{@students.count} students"
    @name = STDIN.gets.chomp
  end
end

def student_data_base
  @students << {name: @name, cohort: :january}
end

def print_header
  # Number of 'puts' reduced to 1 one line instead of 2
  puts "The students of Villains Academy", "--------------------------------"
end

def print_students_list
  @students.each do |student|
   puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, cohort = line.chomp.split(',')
    student_data_base
  end
  file.close
end

def load_from_file
  filename = ARGV.first
 if File.exist?(filename.to_s)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  end
  if filename.nil? && File.exist?(filename = 'students.csv')
    load_students(filename = 'students.csv')
    puts "Loaded #{@students.count} from 'students.csv' "
  end
end

load_from_file
interactive_menu