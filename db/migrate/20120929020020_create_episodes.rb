class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :season_number
      t.integer :episode_number
      t.integer :show_id

      t.timestamps
    end
  end
end
