class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.integer :user_id
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
