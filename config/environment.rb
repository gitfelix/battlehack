# Load the Rails application.
require File.expand_path('../application', __FILE__)

Rails.application.routes.default_url_options[:host] = 'localhost:3000'


# Initialize the Rails application.
Rails.application.initialize!

#setup mailer
ActionMailer::Base.smtp_settings = {
:address => 'smtp.sendgrid.net',
:port => '587',
:authentication => :plain,
:user_name => 'hobnob',
:password => 'stackademy2014',
:domain => 'heroku.com',
:enable_starttls_auto => true
}
