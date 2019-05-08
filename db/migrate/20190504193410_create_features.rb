class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.integer :rapper_id
      t.integer :song_id
    end
  end
end
