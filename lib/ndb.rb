require_relative "ndb/version"
require_relative "ndb/search"

module NDB
  def self.configure
    yield self
  end

  def self.api_key
    @api_key
  end

  def self.api_key=(key)
    @api_key = key
  end

  def self.base_uri
    "http://api.nal.usda.gov/ndb"
  end
end
