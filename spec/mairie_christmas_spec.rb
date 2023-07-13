# test for the file mairie_christmas
require_relative "../lib/mairie_christmas.rb"

describe "control of the table" do
  it "we get an extract" do
    expect(get_hyperlink_mairie_valdoise.nil?).to eq(false)
  end
  it "we get an array" do 
    expect(get_hyperlink_mairie_valdoise.class).to eq(Array)
  end
end

describe "contrôle the scrapped datas" do
  it "check the correct values for the avernes townhall" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")
  end
end