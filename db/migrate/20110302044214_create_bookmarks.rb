class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.string :description
      t.string :permalink
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarks
  end
end
