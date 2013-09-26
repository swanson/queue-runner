class ChangeColumnTypeOfSlug < ActiveRecord::Migration
  def up
    connection.execute(%q{
        alter table shows
        alter column slug
        type integer using slug::int
    })
  end
end
