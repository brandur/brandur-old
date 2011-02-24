# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Brandur::Application.load_tasks

desc 'Updates all remote items'
task :update => 'update:all'

namespace :update do
  desc 'Updates all remote items'
  task :all => [ :articles, :photos, :tweets ]

  desc 'Update articles from blog'
  task :articles => :environment do
    Article.update
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
