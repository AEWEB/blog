require 'rails_helper'

RSpec.describe Task, :type => :model do
  
  it "is invalid success"  do
    task = Task.new(name:"ネーム",goal:"ゴール",memo:"メモ",start_time:"2015-01-03 00:00:00",end_time:"2015-01-03 00:00:00",
      security:"0",state:"1",priority:"2")
    expect(task.valid?).to eq(true)
  end
  
  
  it "is invalid without name"  do
    task = Task.new(name:nil)
    task.valid?
    expect(task.errors[:name]).to include("は3文字以上で入力してください。")
    
   # puts(task.errors.to_yaml)
     
    task = Task.new(name:"ああ")
    task.valid?
    expect(task.errors[:name]).to include("は3文字以上で入力してください。")
      
    task = Task.new(name:"123456789012345678901234567890123456789012345678901")
    task.valid?
    expect(task.errors[:name]).to include("は50文字以内で入力してください。")
  end
  
  it "is invalid without goal"  do
    task = Task.new(goal:nil)
    task.valid?
    expect(task.errors[:goal]).to include("は3文字以上で入力してください。")
      
    task = Task.new(goal:"ああ")
    task.valid?
    expect(task.errors[:goal]).to include("は3文字以上で入力してください。")
      
    task = Task.new(goal:"123456789012345678901234567890123456789012345678901")
    task.valid?
    expect(task.errors[:goal]).to include("は50文字以内で入力してください。")
  end
  
  it "is invalid without memo"  do      
    task = Task.new(memo:"a12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
    task.valid?
    expect(task.errors[:memo]).to include("は500文字以内で入力してください。")
  end
  
  it "is invalid without start time"  do
    #task = Task.new(start_time:"2015-02-30 22:00:00")
    #task.valid?
    #expect(task.errors[:start_time]).to include("は正しい形式で入力してください。")
    task = Task.new(start_time:"tttttttttttt")
    task.valid?
    expect(task.errors[:start_time]).to include("は正しい形式で入力してください。")
  end
  
  it "is invalid without end time"  do
    task = Task.new(end_time:"tttttttttttt")
    task.valid?
    expect(task.errors[:end_time]).to include("は正しい形式で入力してください。")
  end
  
  it "is invalid without security"  do
    task = Task.new(security:"")
    task.valid?
    expect(task.errors[:security]).to include("は1文字以上で入力してください。")
    task = Task.new(security:"5555")
    task.valid?
    expect(task.errors[:security]).to include("は1文字以内で入力してください。")
    task = Task.new(security:"a")
    task.valid?
    expect(task.errors[:security]).to include("は数値で入力してください。")
  end
  
  it "is invalid without state"  do
    task = Task.new(state:"")
    task.valid?
    expect(task.errors[:state]).to include("は1文字以上で入力してください。")
    task = Task.new(state:"5555")
    task.valid?
    expect(task.errors[:state]).to include("は1文字以内で入力してください。")
    task = Task.new(state:"a")
    task.valid?
    expect(task.errors[:state]).to include("は数値で入力してください。")
  end
  
  it "is invalid without priority"  do
    task = Task.new(priority:"")
    task.valid?
    expect(task.errors[:priority]).to include("は1文字以上で入力してください。")
    task = Task.new(priority:"5555")
    task.valid?
    expect(task.errors[:priority]).to include("は1文字以内で入力してください。")
    task = Task.new(priority:"a")
    task.valid?
    expect(task.errors[:priority]).to include("は数値で入力してください。")
  end
  
end
