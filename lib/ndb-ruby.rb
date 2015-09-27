require_relative "ndb/version"
require_relative "ndb/search"
require_relative "ndb/food_report"
require_relative "ndb/list"
require_relative "ndb/nutrient_report"

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

  def self.sanitize_options(options, permitted_params)
    options.select { |param| permitted_params.include?(param.to_s) }
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
end
