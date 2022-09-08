class CreateUserEchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :user_echanges, id: :uuid do |t|
      t.string :title
      t.string :status
      t.string :slug
      t.references :course, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
