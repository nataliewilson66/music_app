class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.boolean :bonus, null: false, default: false

      t.timestamps
    end

    add_index :tracks, :title
    add_index :tracks, :album_id
  end
end
