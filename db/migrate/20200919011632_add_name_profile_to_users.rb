class AddNameProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :profile, :text
  end

  add_index :users, :name, unique: true
end
