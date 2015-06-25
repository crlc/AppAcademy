class Student
  attr_accessor :first_name, :last_name
  attr_reader :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def enroll(course)
    conflict = false
    courses.each do |el|
      el.conflicts_with?(el) ? conflict = true : next
    end
    if conflict
      puts "Sorry schmuck! Course conflict!"
    else
      courses << course
    end
    course.add_student(self)
  end

  def course_load
    loads = Hash.new
    courses.each {|i| loads[i] = i.credits}
  end
end

class Course
  attr_accessor :name, :department, :students, :schedule
  attr_reader :credits

  def initialize(name, department, credits, days, time_block)
    @name = name
    @department = department
    @credits = credits
    @students = []
    @schedule = Hash.new()
    @time_block = time_block
    days.each do |day|
      @schedule[day.to_sym] = time_block
    end
  end

  def add_student(student)
    students << student
  end

  def conflicts_with?(course)
    schedule.keys.each do |day|
      return schedule[day] == course.schedule[day]
    end
  end
end

carlos = Student.new('Carlos', 'Carrera')
zach = Student.new('Zachary', 'Reisman')
aphistory = Course.new('World Civilizations 107', 'History', 4, ['mon', 'wed', 'fri'], 'block2')
calc = Course.new('Intro to Calculus', 'Math', 3, ['tues', 'wed', 'thurs'], 'block2')

carlos.enroll(aphistory)
carlos.enroll(calc)
zach.enroll(calc)
