class AddFkConstraint < ActiveRecord::Migration
  def up
    sql = %Q{
      ALTER TABLE attendants
      ADD CONSTRAINT fk_user_id 
      FOREIGN KEY (user_id) 
      REFERENCES
      users(id) 
      ON DELETE CASCADE
      ON UPDATE CASCADE;
      
      ALTER TABLE attendants
      ADD CONSTRAINT fk_event_id
      FOREIGN KEY (event_id) 
      REFERENCES
      events(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE;
    }

    execute(sql)
  end



  def down
    sql = %Q{
      ALTER TABLE attendants 
      DROP CONSTRAINT IF EXISTS fk_user_id ;
      
      ALTER TABLE attendants 
      DROP CONSTRAINT IF EXISTS fk_event_id ;
    }

    execute(sql)
  end
end
