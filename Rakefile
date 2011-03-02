# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Brandur::Application.load_tasks

desc 'Updates all remote items'
task :update => 'update:all'

namespace :create do
  desc 'Creates a new bookmark'
  task :bookmark => :environment do
    abort('Need title= and permalink=') unless ENV['title'] && ENV['permalink']
    Bookmark.create! :description => ENV['description'], :permalink => ENV['permalink'], :title => ENV['title']
  end
end

namespace :update do
  desc 'Updates all remote items'
  task :all => [ :articles, :fact_stats, :photos, :tweets ]

  desc 'Update articles from blog'
  task :articles => :environment do
    Article.update
  end

  task :fact_stats => :environment do
    FactStat.update
  end

  desc 'Update photos from Flickr'
  task :photos => :environment do
    Photo.update
  end

  desc 'Update tweets from Twitter'
  task :tweets => :environment do
    Tweet.update
  end
end
