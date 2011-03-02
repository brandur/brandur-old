class RenameLinkToPermalink < ActiveRecord::Migration
  def self.up
    rename_column :articles, :link, :permalink
    rename_column :photos,   :link, :permalink
    rename_column :tweets,   :link, :permalink
  end

  def self.down
    rename_column :articles, :permalink, :link
    rename_column :photos,   :permalink, :link
    rename_column :tweets,   :permalink, :link
  end
end
