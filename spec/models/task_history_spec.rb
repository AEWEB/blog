require 'rails_helper'

RSpec.describe TaskHistory, :type => :model do

  describe '#find_user' do
    subject { TaskHistory.find_user(history_id, user_id) }
    
    let(:task_history) { FactoryGirl.create(:task_history,:task_id => task.id) }
    let(:task) { FactoryGirl.create(:task,:user_id => user.id) }
    let(:user) { FactoryGirl.create(:user) }
    let(:history_id) { task_history.id }
    let(:user_id){ user.id  }
    let(:user_for_error) { FactoryGirl.create(:user,:nickname => "userforerror",:mail => "user_for_error@ne.jp") }
    
    context 'success' do
      it { expect(subject.id).to eq(history_id) }
    end
      
    context 'history no hit!' do
      let(:history_id) {"2"}
      it { expect(subject).to eq(nil) }
    end
      
    context 'fail' do
      let(:user_id){ user_for_error.id  }
      it { expect(subject).to eq(nil) }
    end
      
  end
  
  describe 'Task #destroy' do
    subject { task.destroy }
    
    let(:task_history) { FactoryGirl.create(:task_history,:task_id => task.id) }
    let(:task_history_2) { FactoryGirl.create(:task_history,:task_id => task.id) }
    let(:task) { FactoryGirl.create(:task,:user_id => user.id) }
    let(:user) { FactoryGirl.create(:user) }
    let(:history_id) { task_history.id }
    let(:history_id_2) { task_history_2.id }
    
    context 'success' do
      it {
        expect(task_history.id).to eq(history_id)
        expect(task_history_2.id).to eq(history_id_2)
        subject
        expect(TaskHistory.find_by(history_id)).to eq(nil)
        expect(TaskHistory.find_by(history_id_2)).to eq(nil)
      }
    end
  end
  
  describe 'is invalid' do
    context "is invalid success"  do
      it{      
        task_history = TaskHistory.new(
          memo:"メモ",start_time:"2015-01-03 00:00:00",end_time:"2015-01-03 00:00:00")
        expect(task_history.valid?).to eq(true)
      }
    end
    context 'is invalid without start time' do
      it{
        task_history = TaskHistory.new(start_time:"tttttttttttt")
        task_history.valid?
        expect(task_history.errors[:start_time]).to include("は正しい形式で入力してください。")
      }
    end
  
    context 'is invalid without end time' do
      it {
        task = TaskHistory.new(end_time:"tttttttttttt")
        task.valid?
        expect(task.errors[:end_time]).to include("は正しい形式で入力してください。")
      }
    end
    
  end
  

end