class AddPermalinkToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :permalink, :string

    # Save forces validation which generates a permalink
    Book.all.each do |book|
      book.save
    end
  end

  def self.down
    remove_column :books, :permalink
  end
end
