require 'open-uri'

class FactStat < ActiveRecord::Base
  validates_presence_of :last_category_name, :last_category_slug, :last_fact_id, :facts_by_day
  validates_uniqueness_of :last_fact_id

  default_scope :order => 'created_at DESC'

  def self.update
    json = JSON.parse open('http://facts.brandur.org/users/fyrerise.json').read
    return if json['recent_facts'].count < 1
    last_fact = json['recent_facts'].first['fact']
    last_category = last_fact['category']['category']
    fact_stat = FactStat.new :last_category_name => last_category['name'], :last_category_slug => last_category['slug'], :last_fact_id => last_fact['id'], :facts_by_day => json['stats']['facts_by_day'].to_json
    fact_stat.save if fact_stat.valid?
  end
end
