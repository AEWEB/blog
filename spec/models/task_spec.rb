require 'rails_helper'

RSpec.describe Task, :type => :model do
  it "is invalid without projectname"  do
    task = Task.new(name:nil)
    task.valid?
    expect(task.errors[:name]).to include("は3文字以上で入力してください。")
      
    task = Task.new(name:"ああ")
    task.valid?
    expect(task.errors[:name]).to include("は3文字以上で入力してください。")
      
    task = Task.new(name:"123456789012345678901")
    task.valid?
    expect(task.errors[:name]).to include("は20文字以内で入力してください。")
  end
end
