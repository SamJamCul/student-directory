# let's put all students into an array
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.gsub("\n", "")
  while !name.empty? do
    name = name.split", "
    add_student(name[0], name[1])
    puts "now we have #{@students.count} students"
    name = STDIN.gets.gsub("\n", "")
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50, "-")
end

def list_students
  cohorts = []
  n = 0
  @students.each do |name|
    cohorts << name[:cohort] unless cohorts.include? name[:cohort]
  end
  cohorts.each do |group|
    puts "#{group} Cohort".center(50, "_")
    @students.each do |name|
      if name[:cohort] == group
        puts "#{(n+1)}. #{name[:name]} (#{name[:cohort]} cohort)".center(50, "-")
        n += 1
      end
    end
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "Overall, we have one crappy student"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students"
  puts "4. Load the students"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def show_students
  print_header
  list_students
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "Let's start putting students in yeah!"
    students = input_students
  when "2"
    puts "Initiating student display protocol, please stand by"
    show_students
  when "3"
    puts "Creating recovery file, please wait just a minute or less"
    save_students
  when "4"
    "Initiating load sequence, hold your damn horsey"
    load_students
  when "9"
    "Terminating students program, ciao"
    exit 
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  puts "Under what name should this data be captured?"
  name = gets.chomp
  file = File.open(name+".csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil? 
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorray, #{filename} doesn't exist."
    exit
  end
end

def load_students(register = "students.csv")
  file = File.open(register, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort)
  end
  file.close
end

def add_student(name, cohort = nil)
  cohort ||= :November
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
