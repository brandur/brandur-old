Install
=======

These are basic installation instructions for this Rails app.

Bundle 
------

Install dependencies with `bundle install .`.

Raise Database
--------------

Raise the database using `rake db:schema:load`.

Get Data
--------

Make sure to fetch some data for the application using a call to `rake update`. Next, you will set up a cron job to handle this automatically.

Cron Tasks
----------

Install the `whenever` gem and executables on your system using `gem install whenever`. Now run `whenever` from the root directory to see the cron jobs that need to be added (try `whenever --help` too, it can add cron tasks directly to your crontab).
