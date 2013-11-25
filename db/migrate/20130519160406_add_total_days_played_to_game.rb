class AddTotalDaysPlayedToGame < ActiveRecord::Migration
  def change
    add_column :games, :total_days_played, :integer, :default => 0
  end
end
