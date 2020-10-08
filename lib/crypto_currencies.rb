require 'nokogiri'
require 'open-uri'

def currency_names(page)
    currency_names = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div')
    array_names = Array.new
    i = 0
    currency_names.each do |names|
        array_names[i] = names.text
        i = i + 1
    end
    return array_names
end

def currency_values(page)
    currency_values = page.xpath('/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')
    array_values = Array.new
    i = 0
    currency_values.each do |values|
        new = values.text[1...].delete","
        array_values[i] = new.to_f
        i = i + 1
    end
    return array_values
end

def crypto_scrapper
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
    hash_crypto = Hash[currency_names(page).zip(currency_values(page))]
    array_crypto = Array.new
    i = 0
    hash_crypto.each do |key, value|
        array_crypto[i] = {key => value}
        i = i + 1
    end
    return array_crypto
end

def perform
    crypto_scrapper
end

perform
