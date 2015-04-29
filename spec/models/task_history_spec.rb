require 'rails_helper'

RSpec.describe Category, :type => :model do
  describe '#switch_clip_link' do

    describe '#find_user' do
      subject { TaskHistory.find_user(history_id, user_id) }
      
      let!(:task_history) { FactoryGirl.create(:task_history,:task_id => task.id) }
      let(:task) { FactoryGirl.create(:task,:user_id => user.id) }
      let(:user) { FactoryGirl.create(:user) }
      let(:history_id) { task_history.id }
      let(:user_id){ user.id  }
      let(:user_for_error) { FactoryGirl.create(:user,
          :nickname => "userforerror",:mail => "user_for_error@ne.jp") }
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
    
  end
end