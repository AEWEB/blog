require 'rails_helper'

RSpec.describe TaskHistory, :type => :model do

  describe '#find_user' do
    subject { TaskHistory.find_user(history_id, user_id) }
    
    let!(:task_history) { FactoryGirl.create(:task_history,:task_id => task.id) }
    let(:task) { FactoryGirl.create(:task,:user_id => user.id) }
    let(:user) { FactoryGirl.create(:user) }
    let(:history_id) { task_history.id }
    let(:user_id){ user.id  }
    let(:user_for_error) { FactoryGirl.create(:user,:nickname => "userforerror",:mail => "user_for_error@ne.jp") }
    
    context 'success' do
      it { expect(subject.id).to eq(task_history.id) }
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
    
    let!(:task_history) { FactoryGirl.create(:task_history,:task_id => task.id) }
    let!(:task_history_2) { FactoryGirl.create(:task_history,:task_id => task.id) }
    let(:task) { FactoryGirl.create(:task,:user_id => user.id) }
    let(:user) { FactoryGirl.create(:user) }
    let(:history_id) { task_history.id }
    let(:history_id_2) { task_history_2.id }
    #let(:user_id){ user.id  }
    #let(:user_for_error) { FactoryGirl.create(:user,:nickname => "userforerror",:mail => "user_for_error@ne.jp") }
    
    context 'success' do
      it { 
        expect(task_history.reload.id).to eq(history_id)
        expect(task_history_2.reload.id).to eq(history_id_2)
        subject
        #expect(task_history.reload).to eq(nil)
        #expect(task_history_2.reload).to eq(nil)
      }
    end
    
  end

end