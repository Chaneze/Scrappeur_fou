require_relative '../lib/townhall.rb'

describe "the townhall_scrapper" do
    townhall = hash_name_mail
    it "should return an array" do
        expect(townhall.kind_of?(Array)).to eq true
    end

    it "should be composed of hash" do
        expect(townhall.all? {|i| i.is_a?(Hash)}).to eq true
    end

    it "should return 200 values" do
        expect(townhall.length).to eq(185)
    end

    it "mail of ABLEIGES is mairie.ableiges95@wanadoo.fr" do
        expect(townhall[0]["ABLEIGES"]).to eq("mairie.ableiges95@wanadoo.fr")
    end

    it "mail of AINCOURT ifmairie.aincourt@wanadoo.fr" do
        expect(townhall[1]["AINCOURT"]).to eq("mairie.aincourt@wanadoo.fr")
    end

end