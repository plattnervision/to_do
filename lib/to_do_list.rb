class List
  attr_accessor :name

  def initialize(name)
    @tasks_created = 0
    @name = name
    @task_list = {}
    @task1 = Task.new("default1","undefined")
    @task2 = Task.new("default2","undefined")
    @task3 = Task.new("default3","undefined")
    @task_list[@task1.title] = @task1.detail
    @task_list[@task2.title] = @task2.detail
    @task_list[@task3.title] = @task3.detail
    puts @task_list #big sigh
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

  def create_new_task(title, description)
    @task4 = Task.new(title,description)
    @task_list[@task4.title] = @task4.detail
    puts @task_list
  end
  # i want to add a way to automatically +1 the tasks that are being used for the key in the task_list
  # also want to add a method to expose that task list
  # can probably do that by cleaning up the initialize

end

class Task
attr_accessor :title, :detail, :state

def initialize(title, detail)
  @state = "need to do"
  @title = title
  @detail = detail
end
def check_state
  puts @state
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


## >> ## ^^ TO DO FOR THIS (LOL) ^^ ## << ##
# need to add a method that will print out the tasks
# add a way to ratchet through new tasks that are being used for keys
# finish out the script
# come up with better names for everything.. lol 
