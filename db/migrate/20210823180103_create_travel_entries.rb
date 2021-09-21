class CreateTravelEntries < ActiveRecord::Migration[4.2]
  def change
    create_table :travel_entries do |t|
      t.string :content
      t.integer :user_id
      t.string :name_location
      
      t.timestamps null: false
    end
  end
end
