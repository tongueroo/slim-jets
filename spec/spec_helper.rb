require "bundler/setup"

# Mock out Jets just so we can at least have a sanity spec
module Jets
  class Turbine
    def self.initializer(label)
    end
  end
end
require "slim/jets"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
