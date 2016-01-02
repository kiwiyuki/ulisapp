class AddReceptionToEvents < ActiveRecord::Migration
  def change
      add_column :events, :reception, :boolean, :default => true
  end
end
