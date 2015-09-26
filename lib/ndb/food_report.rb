module NDB
  class FoodReport
    def self.retrieve(ndbno:, type: "b")
      params = "#{base_uri}?ndbno=#{ndbno}&type=#{type}&api_key=#{NDB.api_key}"
      response = Faraday.get(params)
      JSON.parse(response.body)
    end

    def self.base_uri
      NDB.base_uri + "/reports"
    end
  end
end
