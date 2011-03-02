class FactStat < ActiveRecord::Base
  validates_presence_of :last_category_name, :last_category_slug, :last_fact_id, :facts_by_day
  validates_uniqueness_of :last_fact_id

  default_scope :order => 'created_at DESC'
end
