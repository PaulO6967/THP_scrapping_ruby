# test for the file dark_trader
require_relative "../lib/dark_trader.rb"

describe "the programme is working by returning an array of hash" do
  it "test if the return is good" do
    expect(scraping_array.nil?).to eq(false)
  end
end

describe "contrôle the scrapped datas" do
  it "check the cryptocurrencies presence" do
    expect(scraping_array.size).to eq(20)
  end
end
