class AddDoublantToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :doublant, :string
  end
end
