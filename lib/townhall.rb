require 'nokogiri'
require 'open-uri'

# Methode qui permet de recuperer le mail d'une ville sur sa page dediee
def get_townhall_email(townhall_url)
	city_page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/#{townhall_url}"))
	townhall_email = city_page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	return townhall_email.text
end

# Methode qui permet de recuperer tous les urls des vills depuis la page du val d'oise, de recuperer les mails a partir de la methode get_townhall_email et les mettre dans un meme array
def get_townhall_urls(page)
	townhall_url = page.xpath('//p/a')
	hrefs = townhall_url.map {|link| link.attribute('href').to_s}.map {|link| link = link[1..-1]}
	array_email = Array.new
	i = 0
	hrefs.each do |url|
		array_email[i] = get_townhall_email(url)
		i = i + 1
	end
	return array_email
end

# Methode qui permet de recuperer tous les noms de villes depuis la page du val d'oise, et de les mettre dans un array
def get_townhall_name(page)
    name = Array.new
    townhall_name = page.xpath('//a[@class=\'lientxt\']')
    i = 0
    townhall_name.each do |city|
        name[i] = city.text
        i = i + 1
    end
    return name
end

# Methode qui permet de regrouper les arrays des noms de ville et des mails dans un meme hash et ensuite de mettre tous ces hashs dans un array
def hash_name_mail
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    hash_mail = Hash[get_townhall_name(page).zip(get_townhall_urls(page))]
    array_mail = Array.new
    i = 0
    hash_mail.each do |name, value|
        array_mail[i] = {name => value}
        i = i + 1
    end
    return array_mail
end

def perform
    hash_name_mail
end

perform