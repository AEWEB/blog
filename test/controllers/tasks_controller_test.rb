require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { ta_end_time: @task.ta_end_time, ta_goal: @task.ta_goal, ta_memo: @task.ta_memo, ta_name: @task.ta_name, ta_priority: @task.ta_priority, ta_security: @task.ta_security, ta_start_time: @task.ta_start_time, ta_status: @task.ta_status }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { ta_end_time: @task.ta_end_time, ta_goal: @task.ta_goal, ta_memo: @task.ta_memo, ta_name: @task.ta_name, ta_priority: @task.ta_priority, ta_security: @task.ta_security, ta_start_time: @task.ta_start_time, ta_status: @task.ta_status }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
