class RemovePrefFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :pref, :string
  end
end
