json.array!(@tasks) do |task|
  json.extract! task, :id, :ta_name, :ta_goal, :ta_memo, :ta_start_time, :ta_end_time, :ta_security, :ta_status, :ta_priority
  json.url task_url(task, format: :json)
end
