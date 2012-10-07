class AddAirdateToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :air_date, :Date

  end
end
