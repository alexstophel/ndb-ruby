require "./spec/spec_helper.rb"

describe NDB::FoodReport do
  describe ".retrieve" do
    it "returns a report by ndbno" do
      VCR.use_cassette("food_report_ndbno") do
        result = NDB::FoodReport.retrieve(ndbno: "01009")
        expect(result["report"]["food"]["ndbno"]).to eq("01009")
      end
    end

    it "returns a report of a specific type" do
      VCR.use_cassette("food_report_type") do
        result = NDB::FoodReport.retrieve(ndbno: "01009", type: "s")
        expect(result["report"]["type"]).to eq("Statistics")
      end
    end
  end
end
