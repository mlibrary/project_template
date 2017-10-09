# frozen_string_literal: true

# Note: We don't require bundler or our entire project here. This allows us to
# require only those files we need to run our tests.

# Add the lib dir to our load path so that we can require the files within it.
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), "../lib/project_template"))

# Require any test helpers we've created.
Dir[File.expand_path(File.join(File.dirname(__FILE__), "support", "**", "*.rb"))]
  .each {|f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = false
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  config.warnings = false

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end
end
