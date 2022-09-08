json.extract! echange, :id, :title, :content, :wiki, :status, :slug, :course_id, :user_id, :created_at, :updated_at
json.url echange_url(echange, format: :json)
json.content echange.content.to_s
json.wiki echange.wiki.to_s
