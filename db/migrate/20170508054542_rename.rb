class Rename < ActiveRecord::Migration[5.0]
  def change
  	rename_column :scratchers, :scratcher_id, :user_id
  end
end
