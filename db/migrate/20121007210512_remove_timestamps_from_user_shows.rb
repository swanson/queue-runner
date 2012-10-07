class RemoveTimestampsFromUserShows < ActiveRecord::Migration
  def up
    remove_column :user_shows, :created_at
    remove_column :user_shows, :updated_at
  end

  def down
  end
end
