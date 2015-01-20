json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :goal, :memo, :start_time, :end_time, :security, :state, :priority
  json.url task_url(task, format: :json)
end
