require 'nokogiri'
require 'open-uri'

#Methode qui permet de recuperer nom, prenom et mail d'un deputes en particulier à partir de sa page
def get_deputy_info(townhall_url)
	deputy_page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr#{townhall_url}"))
	identity = deputy_page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text
    mailto = deputy_page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd/ul/li[2]/a')
    first_name = identity.split[1]
    last_name = identity.split[2]
    email = mailto.map {|link| link.attribute('href').to_s}.map {|link| link = link[7...]}.join
    hash_deputy = {"first_name" => first_name}
    hash_deputy["last_name"] = last_name
    hash_deputy["email"] = email
    return hash_deputy
end

#Methode qui permet de recuperer les urls des pages de chaque députes, de recuperer les donnes a partir de la methode get_deputy_info sous forme de hash et les mettre dans un meme array
def array_deputies
    page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    deputy = page.xpath('//*[@id="deputes-list"]/div/ul/li/a')
    hrefs = deputy.map {|link| link.attribute('href').to_s}
    array_deputy = Array.new
    i = 0
    hrefs.each do |url|
        array_deputy[i] = get_deputy_info(url)
        i = i + 1
    end
    return array_deputy
end

def perform
    puts array_deputies
end

perform