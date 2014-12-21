require 'rails_helper'
describe Project do
    
  
    # 全てのバリデーションが有効であること
    it "is valid with a firstname, lastname and email" do
      project = Project.new(name:"プロジェクト名",purpose:"目的",start_time:"2005/10/16 11:11:12",
        end_time:"2005/10/16 11:11:12",security:"1",project_type:"2",memo:"memo")   
    end
    
    describe '#vaa' do
       
    end
    
    it "is invalid without projectname"  do
      project = Project.new(name:nil)
      project.valid?
      expect(project.errors[:name]).to include("は3文字以上で入力してください。")
      
      project = Project.new(name:"12")
      project.valid?
      expect(project.errors[:name]).to include("は3文字以上で入力してください。")
      
      project = Project.new(name:"123456789012345678901")
      project.valid?
      expect(project.errors[:name]).to include("は20文字以内で入力してください。")
    end
    it "is invalid without a purpose" do
      project = Project.new(purpose:"12")
      project.valid?
      expect(project.errors[:purpose]).to include("は3文字以上で入力してください。")
      
      
    end
    it "is invalid without s start_time" do
      project = Project.new(start_time:nil)
      project.valid?
      expect(project.errors[:start_time]).to include("は正しい形式で入力してください。")
    end
    it "is invalid without s end_time" do
      project = Project.new(end_time:nil)
      project.valid?
      expect(project.errors[:end_time]).to include("は正しい形式で入力してください。")
    end
    it "is invalid without s security" do
      project = Project.new(security:nil)
      project.valid?
      expect(project.errors[:security]).to include("は1文字以上で入力してください。",
        "は数値で入力してください。")
    end
    it "is invalid without s project_type" do
      project = Project.new(project_type:nil)
      project.valid?
      expect(project.errors[:project_type]).to include("は1文字以上で入力してください。",
        "は数値で入力してください。")
    end
    it "is invalid without s memo" do
      project = Project.new(memo:"ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ      
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ
ああああああああああああああああああああああああああああああああああああああああああああああああああ")
      project.valid?
      expect(project.errors[:memo]).to include("は500文字以内で入力してください。")
    end    
end