class List
  def initialize
    task_list = {}
    @task1 = Task.new("default1","undefined")
    @task2 = Task.new("default2","undefined")
    @task3 = Task.new("default3","undefined")
    task_list[@task1.title] = @task1.detail
    task_list[@task2.title] = @task2.detail
    task_list[@task3.title] = @task3.detail
    puts task_list
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

a = List.new


# creates three instances of the Task class when a new List object is created
# Tasks have a few variables but checking the values is kind of bad and does not work
