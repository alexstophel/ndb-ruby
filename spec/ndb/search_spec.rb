require "./spec/spec_helper"

describe NDB::Search do
  describe ".perform" do
    it "returns a list of items as hashes" do
      VCR.use_cassette("search_all_foods") do
        expect(NDB::Search.perform.first.is_a?(Hash)).to eq(true)
      end
    end

    context "with default options" do
      it "returns a list of 50 foods" do
        VCR.use_cassette("search_all_foods") do
          expect(NDB::Search.perform.count).to eq(50)
        end
      end
    end

    context "with options" do
      it "returns results for a query" do
        VCR.use_cassette("search_query") do
          result = NDB::Search.perform(q: "butter")
          expect(result.first["name"].include?("butter")).to eq(true)
        end
      end

      it "returns results for a food group id" do
        VCR.use_cassette("search_food_group") do
          result = NDB::Search.perform(fg: "0500")
          expect(result.first["group"]).to eq("Poultry Products")
        end
      end

      it "returns results sorted by n (name)" do
        VCR.use_cassette("search_sort_name") do
          result = NDB::Search.perform(q: "Cheddar Cheese", sort: "n")
          expect(result.first["name"].include?("Cheddar Cheese")).to eq(true)
        end
      end

      it "returns results based on max" do
        VCR.use_cassette("search_max_rows") do
          result = NDB::Search.perform(max: 100)
          expect(result.count).to eq(100)
        end
      end

      it "ignores unpermitted options" do
        VCR.use_cassette("search_all_foods") do
          result = NDB::Search.perform(format: "XML")
          expect(result.first.is_a?(Hash)).to eq(true)
        end
      end
    end
  end
end
