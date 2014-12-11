Given(/^a greete$/) do
 @level = Level.new
end

When(/^I send it the greet message$/) do
  @name = Level.name
end

Then(/^I should see "(.*?)"$/) do |arg1|
  @name.should == arg1
end