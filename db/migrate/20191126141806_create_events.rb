# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.text :description
      t.datetime :date
      t.integer :user_id

      t.timestamps
    end
  end
end
