json.array!(@projects) do |project|
  json.extract! project, :id, :name, :purpose, :start_time, :end_time, :security, :project_type, :memo
  json.url project_url(project, format: :json)
end
