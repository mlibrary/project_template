# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "ettin"

group :development, :test do
end

group :test do
  gem "simplecov", require: false
end

group :development do
  gem "rubocop"
end
