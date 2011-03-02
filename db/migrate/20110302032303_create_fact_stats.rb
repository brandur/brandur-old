class CreateFactStats < ActiveRecord::Migration
  def self.up
    create_table :fact_stats do |t|
      t.string :last_category_name
      t.string :last_category_slug
      t.string :facts_by_day

      t.timestamps
    end
  end

  def self.down
    drop_table :fact_stats
  end
end
