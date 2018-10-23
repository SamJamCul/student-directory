# let's put all students into an array
def grab_student(array)
  result = Hash.new
  result[:name] = array[0]
  result[:cohort] = array[1].nil? ? :November : array[1].capitalize.to_sym
  return result
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.gsub("\n", "")
  while !name.empty? do
    @students << grab_student(name.split(", "))
    puts "now we have #{@students.count} students"
    name = gets.gsub("\n", "")
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50, "-")
end

def print
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

def interactive_menu
  @students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print
      print_footer
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
