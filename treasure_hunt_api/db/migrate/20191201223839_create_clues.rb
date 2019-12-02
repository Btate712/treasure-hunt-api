class CreateClues < ActiveRecord::Migration[5.2]
  def change
    create_table :clues do |t|
      t.text :text
      t.integer :passcode
      t.string :location
      t.integer :index
      t.integer :hunt_id
      t.integer :image_id

      t.timestamps
    end
  end
end
