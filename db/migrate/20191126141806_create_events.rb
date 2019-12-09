# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.datetime :date

      # t.integer "creator_id"
      # t.index ["creator_id"], name: "index_events_on_creator_id"

      t.timestamps
    end
  end
end
