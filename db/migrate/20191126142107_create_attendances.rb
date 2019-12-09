# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id
      t.integer :attendee_event_id

      t.timestamps
    end
  end
end
