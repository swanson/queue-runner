class CreateUserWatches < ActiveRecord::Migration
  def change
    create_table :user_watches do |t|
      t.integer :user_id
      t.integer :episode_id
      t.boolean :watched

      t.timestamps
    end
  end
end
