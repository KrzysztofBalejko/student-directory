@students = []

def print_menu
  puts "1. Input the students", "2. Show the students", "3. Save the list"
  puts "4. Load the list from file", "5. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def confirmation
  puts " ","-Action was successful-"," "
end

def process(selection)
  case selection
  when "1"
    confirmation
    input_students
  when "2"
    confirmation
    show_students
  # Added new functionality. User can now give files names
  when "3"
    puts "Please give your file a name followed by extension"
    @users_file_save = STDIN.gets.chomp
    confirmation
    save_students
  when "4"
    puts "Please enter your file name followed by extension"
    @users_file_load = STDIN.gets.chomp
    confirmation
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
  puts "Please enter the names of the students", "To finish, just hit return twice"
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
  file = File.open(@users_file_save, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = @users_file_load)
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
