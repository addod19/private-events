# frozen_string_literal: true

class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :email
      t.integer :event_creator
      t.references :event
      t.references :invited_user

      t.timestamps
    end
  end
end
