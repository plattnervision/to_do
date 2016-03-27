class List
  attr_accessor :name

  def initialize(name)
    @tasks_created = 0
    @name = name
    @task_list = {}
    @all_tasks = []
    @i = 0
  end

  # def instance_counter
  #   @i += 1
  # end

  def tasker_questions(num)
    num.each do |x|
      puts "what would you like to call your task"
      name = gets.chomp
      puts "please describe this task"
      details = gets.chomp
      create_new_task(name, details)
    end
  end

 def your_to_do
   puts "your list #{@name}:"
   @task_list.each {|k, v| puts "#{k} - #{v}"}
 end

  def create_new_task(title, description)
    tasker = Task.new(title,description)
    @task_list[tasker.title] = tasker.detail
    #instance_counter
  end

end

class Task
attr_accessor :title, :detail, :state

def initialize(title, detail)
  @state = "need to do"
  @title = title
  @detail = detail
end
def check_state
  puts @state.inspect
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

user_list.your_to_do


## >> ## ^^ TO DO FOR THIS (LOL) ^^ ## << ##
# so the instance of the task class kind of just gets destoryed :/
# i really want to store those for some reason. i guess it feels right 2 me
# come up with better names for everything.. lol
