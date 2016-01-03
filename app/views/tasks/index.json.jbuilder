json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :finished_on
  json.url task_url(task, format: :json)
end
