class CreateTableEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null:false
      t.datetime :event_time 
      t.string :location
      t.string :description
      t.decimal :fees 
      t.timestamps null: false
    end
  end
end
