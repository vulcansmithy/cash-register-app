RSpec.configure do |config|
  # Disable RSpec's default transactional fixtures
  config.use_transactional_fixtures = false

  # Before the entire test suite runs
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  # Before each individual test
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # Special handling for JavaScript tests
  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  # Start the cleaning process before each test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Clean up after each test
  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
