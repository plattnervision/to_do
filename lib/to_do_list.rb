class List
  def initialize
    task_list = {}
    @task1 = Task.new("default1","undefined")
    @task2 = Task.new("default2","undefined")
    @task3 = Task.new("default3","undefined")
    task_list[@task1.title] = @task1.detail
    task_list[@task2.title] = @task2.detail
    task_list[@task3.title] = @task3.detail
  end

end



# creating a new instance of List creates three instances of the Task class
# the task class has a default state of "need to do"
# something is wrong though because these currently have a "nil state"
# only have a class of "task" when checking inside the list class
# need to expose that some how
# should do ^^ with an array, want to push my initialized variables to an array


class Task
attr_accessor :title, :detail

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
a.get_tasks
