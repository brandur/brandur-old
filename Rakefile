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
    bookmark = Bookmark.new :description => ENV['description'], :permalink => ENV['permalink'], :title => ENV['title']
    BookmarksController.new.create bookmark
  end
end

namespace :update do
  desc 'Updates all remote items'
  task :all => [ :articles, :fact_stats, :photos, :tweets ]

  desc 'Update articles from blog'
  task :articles => :environment do
    ArticlesController.new.update
  end

  task :fact_stats => :environment do
    FactStatsController.new.update
  end

  desc 'Update photos from Flickr'
  task :photos => :environment do
    PhotosController.new.update
  end

  desc 'Update tweets from Twitter'
  task :tweets => :environment do
    TweetsController.new.update
  end
end
