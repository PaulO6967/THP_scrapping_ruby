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
  puts "récupération des données en cours"
  page.css('a[class=lientxt]').each do |city_link|
    city_link_relative_path = city_link['href']
    city_link_absolute_path = URI.join(page_url, city_link_relative_path).to_s
    mairies_link_list << city_link_absolute_path
    mairies_name_list << city_link.text
  end
  mairies_email_list = []
  mairies_link_list.each do |townhall_url|
  mairies_email_list << get_townhall_email(townhall_url)
  end
  townhall_email_related_city = []
  mairies_name_list.each_index do |i|
    townhall_email_related_city << { mairies_name_list[i] => mairies_email_list[i] }
    puts townhall_email_related_city
  end
end

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  return page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

get_hyperlink_mairie_valdoise
