class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :album_name
      t.integer :rapper_id
    end
  end
end
