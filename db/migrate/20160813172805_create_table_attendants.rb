class CreateTableAttendants < ActiveRecord::Migration
  def change
    create_table :attendants do |t|
      t.belongs_to :user, index:true 
      t.belongs_to :event, index:true
      t.boolean :attending
      t.timestamps null: false
    end
  end
end
