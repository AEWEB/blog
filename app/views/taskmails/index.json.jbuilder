json.array!(@taskmails) do |taskmail|
  json.extract! taskmail, :id, :from, :address, :cc, :bcc, :subject, :header, :text, :footer, :status, :type
  json.url taskmail_url(taskmail, format: :json)
end
