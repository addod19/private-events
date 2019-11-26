class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
