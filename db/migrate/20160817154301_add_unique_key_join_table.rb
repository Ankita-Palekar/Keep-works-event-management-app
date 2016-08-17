class AddUniqueKeyJoinTable < ActiveRecord::Migration
  def up
    sql = "CREATE UNIQUE INDEX idx_uniq_event_id_user_id ON attendants (event_id, user_id)"
    execute(sql)
  end

  def down
    sql = "DROP INDEX idx_uniq_event_id_user_id"
    execute(sql)
  end
end
