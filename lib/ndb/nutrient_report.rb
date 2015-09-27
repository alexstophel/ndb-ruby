module NDB
  module NutrientReport
    PERMITTED_PARAMS = %w(fg max offset ndbno nutrients sort subset)

    def self.retrieve(options = {})
      sanitized_options = NDB.sanitize_options(options, PERMITTED_PARAMS)
      params = NDB.params_from_hash(default_options.merge(sanitized_options))
      response = Faraday.get("#{base_uri}?#{params}")
      JSON.parse(response.body)
    end

    def self.base_uri
      NDB.base_uri + "/nutrients"
    end

    def self.default_options
      { fq: "", max: 50, offset: 0, sort: "f", format: "JSON", subset: 0,
        api_key: NDB.api_key }
    end
  end
end
