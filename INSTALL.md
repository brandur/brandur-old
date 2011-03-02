Install
=======

These are basic installation instructions for this Rails app.

Bundle 
------

Install dependencies with `bundle install .`.

Raise Database
--------------

Raise the database using `rake db:schema:load`.

Cron Tasks
----------

Install the `whenever` gem and executables on your system using `gem install whenever`. Now run `whenever` from the root directory to see the cron jobs that need to be added (try `whenever --help` too, it can add cron tasks directly to your crontab).
