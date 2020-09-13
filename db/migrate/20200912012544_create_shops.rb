class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :pref
      t.string :address
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
