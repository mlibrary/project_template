# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# For libraries, avoid specifying gem versions. For apps, gem versions are recommended.
# Similarly, apps should commit Gemfile.lock, while gems should not.

# Rake is not recommended for most use cases. Typically, it is better to create
# a plain ruby object that handles the code, then create a script in bin that
# delegates to that object. We include it here to allow the inclusion of the rake
# binstub.
gem "rake"

gem "ettin"
gem "canister"

group :development, :test do
end

group :test do
  gem "coveralls", require: false
end

group :development do
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "yard"
end
