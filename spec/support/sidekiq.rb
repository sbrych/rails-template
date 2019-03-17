require "sidekiq/testing"
Sidekiq::Testing.inline!
Sidekiq::Logging.logger = nil

RSpec.configure do |config|
  config.before(:example) do |_example|
    # Clears out the jobs for tests using the fake testing
    Sidekiq::Worker.clear_all
  end
end
