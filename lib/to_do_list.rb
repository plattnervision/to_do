class List
  attr_accessor :name

  def initialize(name)
    @name = name
    task_list = {}
    @task1 = Task.new("default1","undefined")
    @task2 = Task.new("default2","undefined")
    @task3 = Task.new("default3","undefined")
    task_list[@task1.title] = @task1.detail
    task_list[@task2.title] = @task2.detail
    task_list[@task3.title] = @task3.detail
    puts task_list #big sigh
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
  puts @state
end

end

puts "uh suh dude >o"
puts "do you want to create a new list of things to do?"
puts ">> yes or anything else will just kick ya out"
response = gets.chomp

if response.downcase != "yes"
  puts "all right, no list for you"
else
  puts "cool, then what should we name the list?"
  list_name = gets.chomp
  puts "thanks for that list name, generating the list now"
  user_list = List.new(list_name)
  puts "the name of your list is #{user_list.name}"
end



# creates three instances of the Task class when a new List object is created
# Tasks have a few variables but checking the values is kind of bad and does not work
