class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, null: false
      t.integer :year, null: false
      t.boolean :studio_album, null: false, default: true

      t.timestamps
    end

    add_index :albums, :title
  end
end
