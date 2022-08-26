json.extract! course, :id, :title, :content, :level_name, :material_name, :status, :published, :slug, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
