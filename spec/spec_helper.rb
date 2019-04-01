# frozen_string_literal: true


# Note: We don't require our entire project here. This allows us to
# require only those files we need to run our tests.
require "bundler/setup"

# Start code coverage. This must be before your application code is required.
# This setup is actually more advanced than is required, but it illustrates
# where the most common options can be modified. The following would also
# get the job done for simple projects:
#   require "coveralls"
#   Coveralls.wear!           # non-rails projects
#   Coveralls.wear!('rails')  # rails projects
require "simplecov"
require "coveralls"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])
SimpleCov.start do
  add_filter 'config/initializers'
end


# Require any test helpers we've created in spec/support
Dir[File.expand_path(File.join(File.dirname(__FILE__), "support", "**", "*.rb"))]
  .each {|f| require f }


RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # This is the behavior most people expect. If you want to use verifying
    # doubles, feel free.
    mocks.verify_partial_doubles = false
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!

  # Warnings showing up in test runs are not all that helpful. We rely
  # on the style linter to flag these.
  config.warnings = false

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end
end
