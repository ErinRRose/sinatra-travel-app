class CreateTravelEntries < ActiveRecord::Migration
  def change
    create_table :travel_entries do |t|
      t.string :content
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
