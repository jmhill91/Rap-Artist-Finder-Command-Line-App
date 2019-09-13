class CreateSubgenres < ActiveRecord::Migration[5.2]
  def change
    create_table :subgenrees do |t|
      t.string :type
      t.integer :song_id
    end
  end
end
