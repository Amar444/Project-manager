json.array!(@workhours) do |workhour|
  json.extract! workhour, :id, :hours, :note, :date_of_workhour, :user_id, :project_id
  json.url workhour_url(workhour, format: :json)
end
