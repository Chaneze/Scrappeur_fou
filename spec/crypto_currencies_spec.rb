require_relative '../lib/crypto_currencies.rb'

describe "the crypto_scrapper" do
	crypto = crypto_scrapper
	it "should return an array" do
		expect(crypto.kind_of?(Array)).to eq true
	end

	it "should be composed of hash" do
		expect(crypto.all? {|i| i.is_a?(Hash)}).to eq true
	end

	it "should return 200 values" do
		expect(crypto.length).to eq(200)
	end

	it "value of BTC should be 10905.3" do
		expect(crypto[0]["BTC"]).to be_within(200.5).of(10905.3)
	end

	it "value of ETH should be 10903.39" do
		expect(crypto[1]["ETH"]).to be_within(50.5).of(351.72)
	end

end
