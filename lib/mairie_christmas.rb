# scrapping data for the mairie in valed d'oise
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_hyperlink_mairie_valdoise
  mairies_name_list = []
  mairies_link_list =[]
  page_url = "https://www.annuaire-des-mairies.com/val-d-oise.html"
  page = Nokogiri::HTML(URI.open(page_url))
  page.xpath('/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/p[2]/object/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]').each do |city|
    puts mairies_name_list << city
  end
    binding.pry
    #mairies_name_list << mairie.text
  #mairies_link_list << mairie.
end

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  puts page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

get_hyperlink_mairie_valdoise

#get_townhall_email("http://annuaire-des-mairies.com/95/avernes.html")