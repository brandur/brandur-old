class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string  :title,       :null => false
      t.string  :subtitle
      t.string  :author,      :null => false
      t.date    :finished_at, :null => false
      t.integer :rating
      t.text    :review
      t.text    :synopsis

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
