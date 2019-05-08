class  CreateRappers < ActiveRecord::Migration[5.2]
  def change
    create_table :rappers do |t|
      t.string :name
      t.string :region
      t.string :gender
    end 
  end
end
