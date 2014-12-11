require 'rails_helper'
 
RSpec.describe Level, :type => :model do
  it "isn't valid without user_id" do
    borrowing = Level.new
    borrowing.name = nil
    expect(borrowing).not_to be_valid
  end
end