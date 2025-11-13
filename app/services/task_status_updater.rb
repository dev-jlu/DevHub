class TaskStatusUpdater
  def initialize(task, new_status)
    @task = task
    @new_status = new_status
  end

  def call
    @task.status = @new_status
    @task.save
  end
end
