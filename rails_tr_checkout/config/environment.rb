RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # braintree gem is configured in config/initializers/braintree.rb
  config.gem "braintree", :version => "1.1.1"

  config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
end
