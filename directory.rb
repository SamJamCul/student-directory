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
  name = gets.gsub("\n", "")
  while !name.empty? do
    students << grab_student(name.split(", "))
    puts "now we have #{students.count} students"
    name = gets.gsub("\n", "")
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50, "-")
end

def print(names)
  cohorts = []
  n = 0
  names.each do |name|
    cohorts << name[:cohort] unless cohorts.include? name[:cohort]
  end
  cohorts.each do |group|
    puts "#{group} Cohort".center(50, "_")
    names.each do |name|
      if name[:cohort] == group
        puts "#{(n+1)}. #{name[:name]} (#{name[:cohort]} cohort)".center(50, "-")
        n += 1
      end
    end
  end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students"
  else
    puts "Overall, we have one crappy student"
  end
end

students = []
while students == []
  students = input_students
end
print_header
print(students)
print_footer(students)
