json.extract! flash_card, :id, :title, :slug, :course_id, :user_id, :created_at, :updated_at
json.url flash_card_url(flash_card, format: :json)
