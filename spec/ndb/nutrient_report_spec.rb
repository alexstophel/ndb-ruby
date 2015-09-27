require "./spec/spec_helper"

describe NDB::NutrientReport do
  describe ".retrieve" do
    it "returns a report based on a food group" do
      VCR.use_cassette("nutrient_report_food_group") do
        result = NDB::NutrientReport.retrieve(nutrients: 205, fg: "0100")
        group = result["report"]["groups"].first
        expect(group["id"]).to eq("0100")
      end
    end

    it "returns a report with a max set" do
      VCR.use_cassette("nutrient_report_max") do
        result = NDB::NutrientReport.retrieve(nutrients: 205, max: 100)
        expect(result["report"]["foods"].count).to eq(100)
      end
    end

    it "returns a report with an offset" do
      VCR.use_cassette("nutrient_report_offset") do
        result = NDB::NutrientReport.retrieve(nutrients: 205, offset: 1)
        expect(result["report"]["start"]).to eq(1)
      end
    end

    it "returns a report for a single ndbno" do
      VCR.use_cassette("nutrient_report_ndbno") do
        result = NDB::NutrientReport.retrieve(nutrients: 205, ndbno: "01009")
        expect(result["report"]["foods"].count).to eq(1)
      end
    end

    it "returns a report based on an array of nutrients" do
      VCR.use_cassette("nutrient_report_nutrients") do
        result = NDB::NutrientReport.retrieve(nutrients: [205, 204])
        nutrient = result["report"]["foods"].first["nutrients"].first
        expect(["205", "204"].include?(nutrient["nutrient_id"])).to eq(true)
      end
    end

    it "returns a report with an abridged subset" do
      VCR.use_cassette("nutrient_report_subset") do
        result = NDB::NutrientReport.retrieve(nutrients: 205, subset: 1)
        expect(result["report"]["subset"]).to eq("Abridged List")
      end
    end
  end
end
