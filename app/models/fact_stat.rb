require 'open-uri'

class FactStat < ActiveRecord::Base
  default_scope :order => 'created_at DESC'

  def self.update
    json = JSON.parse open('http://facts.brandur.org/users/fyrerise.json').read
    return if json['recent_facts'].count < 1
    last_category = json['recent_facts'].first['fact']['category']
    fact_stat = FactStat.new :last_category_name => last_category['name'], :last_category_slug => last_category['slug'], :facts_by_day => json['stats']['facts_by_day']
    
    puts fact_stat.inspect
  end
end
