require "./spec/spec_helper"

describe NDB::List do
  describe ".retrieve" do
    it "retrieves a list by type" do
      VCR.use_cassette("list_type") do
        result = NDB::List.retrieve(lt: "n")
        expect(result["list"]["lt"]).to eq("n")
      end
    end

    it "retrieves a list with a max set" do
      VCR.use_cassette("list_max") do
        result = NDB::List.retrieve(max: 100)
        expect(result["list"]["item"].count).to eq(100)
      end
    end

    it "retrieves a list with an offset" do
      VCR.use_cassette("list_offset") do
        result = NDB::List.retrieve(offset: 1)
        expect(result["list"]["start"]).to eq(1)
      end
    end

    it "retrieves a list with a sort order" do
      VCR.use_cassette("list_sort") do
        result = NDB::List.retrieve(sort: "id")
        expect(result["list"]["sort"]).to eq("id")
      end
    end
  end
end
