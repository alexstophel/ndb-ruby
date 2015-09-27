require "json"
require "faraday"

module NDB
  module Search
    PERMITTED_PARAMS = %w(q fg sort max offset api_key)

    def self.perform(options = {})
      sanitized_options = NDB.sanitize_options(options, PERMITTED_PARAMS)
      params = NDB.params_from_hash(default_options.merge(sanitized_options))
      response = Faraday.get("#{base_uri}?#{params}")
      JSON.parse(response.body)
    end

    def self.base_uri
      NDB.base_uri + "/search"
    end

    def self.default_options
      { q: "", fg: "", sort: "r", max: 50, offset: 0, format: "JSON",
        api_key: NDB.api_key }
    end
  end
end
