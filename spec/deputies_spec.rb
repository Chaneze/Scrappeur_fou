require_relative '../lib/deputies.rb'

describe "the deputies_scrapper" do
    deputies = array_deputies
    it "should return an array" do
        expect(deputies.kind_of?(Array)).to eq true
    end

    it "should be composed of hash" do
        expect(deputies.all? {|i| i.is_a?(Hash)}).to eq true
    end

    it "should return 577 values" do
        expect(deputies.length).to eq(576)
    end

    it "first deputy is Damien Abad, damien.abad@assemblee-nationale.fr" do
        expect(deputies[0]["first_name"]).to eq("Damien")
        expect(deputies[0]["last_name"]).to eq("Abad")
        expect(deputies[0]["email"]).to eq("damien.abad@assemblee-nationale.fr")
    end

    it "last deputy is Michel Zumkeller, michel.zumkeller@assemblee-nationale.fr" do
        expect(deputies[575]["first_name"]).to eq("Michel")
        expect(deputies[575]["last_name"]).to eq("Zumkeller")
        expect(deputies[575]["email"]).to eq("michel.zumkeller@assemblee-nationale.fr")
    end

end