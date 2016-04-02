require 'pry'

class List
  attr_accessor :name

  def initialize(name)
    @name = name
    @task_list = {}
    @all_tasks = []
    @i = 0
  end

  def counter
    @i += 1
  end

  def create_new_task(title, description)
    tasker = Task.new(title,description)
    @all_tasks.push(instance_variable_set("@task#{@i}", tasker))
    counter
    # this creates and saves the instance of the task / assigns a variable
  end

  def puts_tasks
    # clears the key and values of a hash because
    # each time we want to generate this new because if i change the title
    # of a task it will create a new k => v pair instead of replacing
    @task_list.clear
    @all_tasks.each do |x|
      @task_list[x.title] = x.detail
    end
    puts "Your list #{@name}"
    @task_list.each {|k, v| puts "#{k} >> #{v}"}
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

attr_accessor :title, :detail, :state

def initialize(title, detail)
  @state = "need to do"
  @title = title
  @detail = detail
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
# store and name instance variables for each one

task_aray = Array.new(number_o_tasks)
user_list.tasker_questions(task_aray)


user_list.puts_tasks




## >> ## ^^ TO DO FOR THIS (LOL) ^^ ## << ##
# was able to remove the class Task variable by storing the instances
# created in my List class in an array

## need to decouple tasker questions
## put together a lil method to check if a task exists and if so change any of that tasks values
## already kind of have that in a quick and dirty test file
## rename the instance variables and method names to not be so dumb


### i had a hard time with where to start with the tracking instance problem
### i think a big part of that problem was that I was trying to tackle the issue
### in the context of the entire project instead of thinking of it in a more abstracted way
### i ended up just writing a really simple two class thing in a throw away file
### to figure out and quickly test how it should work.
