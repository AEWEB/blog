json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :address, :memo, :start_time, :end_time, :state, :priority
  json.url task_url(task, format: :json)
end
