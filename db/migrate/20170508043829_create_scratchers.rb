class CreateScratchers < ActiveRecord::Migration[5.0]
  def change
    create_table :scratchers do |t|
      t.string :color
      t.string :price
      t.integer :scratcher_id
      t.timestamps
    end
  end
end
