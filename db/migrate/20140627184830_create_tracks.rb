class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.integer :band_id, null: false

      t.timestamps
    end
    add_index :tracks, :album_id
    add_index :tracks, :band_id
    add_index :tracks, [:album_id, :band_id]
  end
end
