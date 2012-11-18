class CreateEpisodeLinks < ActiveRecord::Migration
  def change
    create_table :episode_links do |t|
      t.references :episode
      t.string :url
      t.string :source

      t.timestamps
    end
  end
end
