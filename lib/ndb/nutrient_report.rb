module NDB
  class NutrientReport
    PERMITTED_PARAMS = %w(fg max offset ndbno nutrients sort subset)

    def self.retrieve(options = {})
      sanitized_options = sanitize_options(options)
      params = params_from_hash(default_options.merge(sanitized_options))
      response = Faraday.get("#{base_uri}?#{params}")
      JSON.parse(response.body)
    end

    def self.base_uri
      NDB.base_uri + "/nutrients"
    end

    def self.sanitize_options(options)
      options.select { |param| PERMITTED_PARAMS.include?(param.to_s) }
    end

    def self.params_from_hash(hash)
      hash.map do |param|
        param_list = []
        if param.last.is_a?(Array)
          param.last.each do |p|
            param_list << "nutrients=#{p}"
          end
        else
          param_list << "#{param.first}=#{param.last}"
        end
        param_list.join("&")
      end.join("&")
    end

    def self.default_options
      { fq: "", max: 50, offset: 0, sort: "f", format: "JSON", subset: 0,
        api_key: NDB.api_key }
    end
  end
end
