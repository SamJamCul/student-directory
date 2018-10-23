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
  students = []
  name = gets.chomp
  while !name.empty? do
    students << grab_student(name.split(", "))
    puts "now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  n = 0
  while n < names.length
    puts "#{(n+1)}. #{names[n][:name]} (#{names[n][:cohort]} cohort)".center(50, "-")
    n += 1
  end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students"
  else
    puts "Overall, we have one crappy student"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
