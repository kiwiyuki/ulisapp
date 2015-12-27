class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.text :summary

      t.timestamps null: false
    end
  end
end
