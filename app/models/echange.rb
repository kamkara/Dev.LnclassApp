class Echange < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_rich_text :content
  has_rich_text :wiki

  ################## FIX N+1  ###############
  content.all.with_rich_text_content # Preload the body without attachments.
  content.all.with_rich_text_content_and_embeds # Preload both body and attachments.
  
  wiki.all.with_rich_text_content 
  wiki.all.with_rich_text_content_and_embeds

  #setup validation and uniqueness
  validates :title, presence: true, uniqueness: { scope: :course_id }
  validates :content, :slug, :course_id, presence: true

  #Slugged concern
  include ItemsSlugged
end
