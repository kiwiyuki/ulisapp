class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :grade
      t.text :comment

      t.timestamps null: false
    end
  end
end
