require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"
PAGE = Nokogiri::HTML(URI.open(PAGE_URL))

def scraping_array
  page = Nokogiri::HTML(URI.open(PAGE_URL))
  puts "Recuparation des données en cours :"
  symbols_array = []
  page.xpath('//tr/td[3]/div').each do |symbol|
    symbols_array << symbol.content
  end
  prices_array = []
  page.xpath('//tr/td[5]/div').each do |symbol|
    prices_array << symbol.content
  end
  crypto_symbols_by_prices_arrey = []
  (0..(symbols_array.size - 1)).each do |crypto|
    crypto_symbols_by_prices_arrey << { symbols_array[crypto] => prices_array[crypto] }
  end
  puts crypto_symbols_by_prices_arrey
  return crypto_symbols_by_prices_arrey
end

scraping_array
