class CreateFlashCards < ActiveRecord::Migration[7.0]
  def change
    create_table :flash_cards, id: :uuid do |t|
      t.string :title, null: false
      t.string :slug
      t.references :course, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    # Adding uniqueness constraint for the couple title and course_id
    add_index :flash_cards, [:title, :course_id], unique: true
    # Adding index to the date field for performance reasons
    add_index :flash_cards, :title
  end
end
