require 'rails_helper'

RSpec.describe Level, :type => :model do
  it "isn't valid without level name" do
    level = Level.new
    level.name = nil
    expect(level).not_to be_valid
  end
end
