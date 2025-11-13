require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  setup do
    @project = projects(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get project_tasks_url(@project)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post project_tasks_url(@project), params: { task: { title: "New Task", description: "A new task" } }
    end

    assert_response :created
  end

  test "should show task" do
    get project_task_url(@project, @task)
    assert_response :success
  end

  test "should update task" do
    patch project_task_url(@project, @task), params: { task: { title: "Updated Task" } }
    assert_response :success
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete project_task_url(@project, @task)
    end

    assert_response :no_content
  end
end