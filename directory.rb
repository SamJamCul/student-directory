# let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  i = 0
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "What's their hobby though?"
    students[i][:hobby] = gets.chomp
    puts "And what about their country of birth?"
    students[i][:birthplace] = gets.chomp
    puts "now we have #{students.count} students"
    i += 1
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
    puts "#{(n+1)}. #{names[n][:name]} (#{names[n][:cohort]} cohort)"
    n += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
