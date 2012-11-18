class DropEpisodeLinks < ActiveRecord::Migration
  def up
    drop_table :episode_links
  end

  def down
  end
end
