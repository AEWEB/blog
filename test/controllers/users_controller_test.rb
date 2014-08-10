require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :redirect
    assert_redirected_to root_path
    assert_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'users/new'
  end

  test "should create user" do
    post :create, user: {nickname: "testcreaete", password: "sohara" }
    assert_response :success
    assert_template 'users/new'
    assert_difference('User.count') do
      post :create, user: { mail: "test@co.jp", nickname: "testcreaete", password: "sohara" }
    end
    assert_redirected_to top_index_path
    assert_equal session[:user_id],assigns(:user).id
  end
  
  

  test "should show user" do
    get :show, id: @user
    assert_response :redirect
    assert_redirected_to new_session_path
    session[:user_id]=@user.id
    get :show, id: @user
    assert_response :success
    assert_template 'users/show'
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :redirect
    assert_redirected_to new_session_path
    session[:user_id]=@user.id
    get :edit, id: @user
    assert_response :success
    assert_template 'users/edit'
  end

  test "should update user" do
    patch :update, id: @user, user: {mail: "testaa@co.jp", nickname:"aatestcreaete"}
    assert_response :redirect
    assert_redirected_to new_session_path
    session[:user_id]=@user.id
    patch :update, id: @user, user: {mail: "testaa@co.jp", nickname:"aatestcreaete"}
    assert_redirected_to user_path(assigns(:user))
  end
=begin
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
 
=end
end
