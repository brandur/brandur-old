# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Brandur::Application.load_tasks

desc 'Updates all remote items'
task :update => 'update:all'

namespace :create do
  desc 'Creates a new file in which to store book data'
  task :book => :environment do
    abort('Need title=') unless ENV['title']

    book = Book.new :title => ENV['title']
    book.valid? # it's not
    path = "./books/#{book.permalink}.yml"

    if File.exists?(path)
      $stderr.puts "\t[error] Exists #{path}"
      exit 1
    end

    template = <<TEMPLATE
title:  "#{book.title}"
subtitle: 
permalink: #{book.permalink}
author: 
finished_at: #{Time.now.to_date.iso8601}
rating: 5 # out of 10
review: |
  My review of the book.
synopsis: 
TEMPLATE

    `mkdir -p ./books/`
    File.open(path, 'w') { |f| f.write(template) }
    `ln -f -s #{path} current_book`
    $stdout.puts "\t[ok] Edit #{path}"
  end

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

  desc 'Update books from *.yml files in books/, use path= for a specific book'
  task :books => :environment do
    paths = if ENV['path'] then [ENV['path']] else Dir['books/*.yml'] end
    BooksController.new.update(paths)
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
