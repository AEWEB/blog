require 'rails_helper'

RSpec.describe "tasks/new", :type => :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :goal => "MyString",
      :memo => "MyString",
      :security => 1,
      :state => 1,
      :priority => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_goal[name=?]", "task[goal]"

      assert_select "input#task_memo[name=?]", "task[memo]"

      assert_select "input#task_security[name=?]", "task[security]"

      assert_select "input#task_state[name=?]", "task[state]"

      assert_select "input#task_priority[name=?]", "task[priority]"
    end
  end
end
