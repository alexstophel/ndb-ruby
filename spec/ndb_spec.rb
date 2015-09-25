require "./spec/spec_helper"

describe NDB do
  describe ".configuration" do
    it "allow confugiration of an api_key" do
      NDB.configure do |config|
        config.api_key = "abc123"
      end

      expect(NDB.api_key).to eq("abc123")
    end
  end
end
