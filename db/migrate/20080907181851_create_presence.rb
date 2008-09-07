class CreatePresence < ActiveRecord::Migration
  def self.up
    create_table :presence do |t|
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end

  def self.down
    drop_table :presence
  end
end
