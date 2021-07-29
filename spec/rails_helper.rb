require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'


begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"


  
  config.use_transactional_fixtures = true

  config.include RequestSpecHelper
  config.include ControllerSpecHelper

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  
  require 'shoulda/matchers'

  Shoulda::Matchers.configure do |should_matchers_config|
    should_matchers_config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end


  
  config.infer_spec_type_from_file_location!


  config.filter_rails_from_backtrace!

  
end
