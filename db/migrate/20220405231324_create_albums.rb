class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :band_id, null:false
      t.string :title, null:false
      t.integer :year, null:false
      # default to studio album
      t.boolean :live, null:false, default: false

      t.timestamps
    end
  end
end
