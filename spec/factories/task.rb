FactoryGirl.define do
  factory :task do
    name 'spectest'
    goal "ゴール"
    memo "メモ"
    start_time "2015-01-03 00:00:00"
    end_time "2015-01-03 00:00:00"
    security "0"
    state "1"
    priority "2"
    category_id nil
  end
end
