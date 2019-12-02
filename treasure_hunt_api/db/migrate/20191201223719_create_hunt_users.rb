class CreateHuntUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :hunt_users do |t|
      t.string :user_type
      t.integer :user_id
      t.integer :hunt_id

      t.timestamps
    end
  end
end
