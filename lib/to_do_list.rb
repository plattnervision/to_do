# TODO FOR THIS

# booshed in a way to mark a task as done. through a bit of testing decided
# the easiest thing to do was to create a new array equal to @to_do
# and then delete everything but the task that matched the title provided

## puts completed task
## check if task is done (@completed.include?(task)
## fix those questions dude X_X

require 'pry'

class List
  attr_accessor :name

  def initialize(name)
    @name = name
    @task_list = {}
    @to_do = []
    @completed = []
    @i = 0
  end

  def counter
    @i += 1
  end

  def create_new_task(title, description)
    tasker = Task.new(title,description)
    @to_do.push(instance_variable_set("@task#{@i}", tasker))
    binding.pry
    counter
  end

  def puts_tasks
    @task_list.clear
    @to_do.each do |x|
      @task_list[x.title] = x.detail
    end
    puts "Your list #{@name}"
    @task_list.each {|k, v| puts "#{k} >> #{v}"}
  end

  def mark_as_done(task_name)
    newarray = Array.new(@to_do)
    newarray.delete_if {|x| x.title != task_name}
    newarray[0].done
    @completed << newarray[0]
    clean_up
  end

  def clean_up
    @to_do.delete_if {|x| x.todo == "donzo"}
  end

  def is_this_a_task(name)
    @to_do.each do |check|
      return true if check.title = name
    end
  end

  def tasker_questions(num)
    num.each do |x|
      puts "what would you like to call your task"
      name = gets.chomp
      puts "please describe this task"
      details = gets.chomp
      create_new_task(name, details)
    end
  end
end

class Task

attr_accessor :title, :detail, :todo

def initialize(title, detail)
  @todo = "not done"
  @title = title
  @detail = detail
end

def done
  @todo = "donzo"
end

end

puts "uh suh dude >o"
puts "do you want to create a new list of things to do?"
puts ">> yes or anything else will just kick ya out"
response = gets.chomp

if response.downcase != "yes"
  puts "all right, no list for you"
  exit
else
  puts "cool, then what should we name the list?"
  list_name = gets.chomp
  puts "thanks for that list name, generating the list now"
  user_list = List.new(list_name)
  puts "the name of your list is #{user_list.name}"
end

puts "cool, now lets name your tasks"

puts "how many things do you have to do?"
number_o_tasks = gets.chomp.to_i
if number_o_tasks <= 0
  puts "plz use human numbers or GTFO"
end

task_aray = Array.new(number_o_tasks)
user_list.tasker_questions(task_aray)


user_list.puts_tasks
user_list.mark_as_done("new")
puts "!>!>!>!>!>!>!>!>"
user_list.puts_tasks
