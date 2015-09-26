module NDB
  class List
    PERMITTED_PARAMS = %w(lt max offset sort api_key)

    def self.retrieve(options = {})
      sanitized_options = sanitize_options(options)
      params = params_from_hash(default_options.merge(sanitized_options))
      response = Faraday.get("#{base_uri}?#{params}")
      JSON.parse(response.body)
    end

    def self.base_uri
      NDB.base_uri + "/list"
    end

    def self.sanitize_options(options)
      options.select { |param| PERMITTED_PARAMS.include?(param.to_s) }
    end

    def self.params_from_hash(hash)
      hash.map do |param|
        "#{param.first}=#{param.last}"
      end.join("&")
    end

    def self.default_options
      { lt: "f", max: 50, offset: 0, sort: "n", format: "JSON",
        api_key: NDB.api_key }
    end
  end
end
