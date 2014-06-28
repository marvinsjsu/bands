class AddProductionColumnToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :production, :string
    change_column :albums, :production, :string, null: false
    add_column :tracks, :lyrics, :text
    add_column :tracks, :track_type, :string
  end
end
