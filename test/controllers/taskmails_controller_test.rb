require 'test_helper'

class TaskmailsControllerTest < ActionController::TestCase
  setup do
    @taskmail = taskmails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taskmails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taskmail" do
    assert_difference('Taskmail.count') do
      post :create, taskmail: { address: @taskmail.address, bcc: @taskmail.bcc, cc: @taskmail.cc, footer: @taskmail.footer, from: @taskmail.from, header: @taskmail.header, status: @taskmail.status, subject: @taskmail.subject, text: @taskmail.text, type: @taskmail.type }
    end

    assert_redirected_to taskmail_path(assigns(:taskmail))
  end

  test "should show taskmail" do
    get :show, id: @taskmail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taskmail
    assert_response :success
  end

  test "should update taskmail" do
    patch :update, id: @taskmail, taskmail: { address: @taskmail.address, bcc: @taskmail.bcc, cc: @taskmail.cc, footer: @taskmail.footer, from: @taskmail.from, header: @taskmail.header, status: @taskmail.status, subject: @taskmail.subject, text: @taskmail.text, type: @taskmail.type }
    assert_redirected_to taskmail_path(assigns(:taskmail))
  end

  test "should destroy taskmail" do
    assert_difference('Taskmail.count', -1) do
      delete :destroy, id: @taskmail
    end

    assert_redirected_to taskmails_path
  end
end
