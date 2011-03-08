require 'open-uri'

class FactStatsController < ApplicationController
  def update
    json = JSON.parse open('http://facts.brandur.org/users/fyrerise.json').read
    return if json['recent_facts'].count < 1
    last_fact = json['recent_facts'].first['fact']
    last_category = last_fact['category']['category']
    fact_stat = FactStat.new :last_category_name => last_category['name'], :last_category_slug => last_category['slug'], :last_fact_id => last_fact['id'], :facts_by_day => json['stats']['facts_by_day'].to_json
    if fact_stat.valid?
      fact_stat.save
      #expire_page :controller => :home, :action => :index
    end
  end
end
