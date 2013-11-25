class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :remote_cover
      t.integer :rate
      t.text :review
      t.string :state, :default => "current"
      t.integer :total_sessions, :default => 0
      t.date :started_on
      t.date :finished_on
      t.text :url
      t.text :blurb
      t.text :forum_url
      t.timestamps
    end
  end
end
