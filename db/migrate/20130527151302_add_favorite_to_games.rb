class AddFavoriteToGames < ActiveRecord::Migration
  def change
    add_column :games, :favorite, :boolean, :default => false
  end
end
