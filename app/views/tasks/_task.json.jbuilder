json.extract! task, :id, :title, :description, :duedate, :tstage, :tcategory, :coworker, :creator, :created_at, :updated_at
json.url task_url(task, format: :json)
