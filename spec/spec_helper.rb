if ENV["CODECLIMATE_REPO_TOKEN"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require "./lib/ndb-ruby"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.ignore_hosts "codeclimate.com"
end

RSpec.configure do |c|
  c.before(:all) do
    NDB.configure do |config|
      config.api_key = "DEMO_KEY"
    end
  end
end
