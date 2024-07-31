# require 'selenium-webdriver'
require 'nokogiri'

# options = Selenium::WebDriver::Chrome::Options.new
# options.add_argument('--headless')
# driver = Selenium::WebDriver.for(:chrome, options: options)

# url = "https://tipti.market/Supermaxi/Frutas"
# url = 'https://www.supermercadosantamaria.com/categorias/frutas-y-verduras/02'
# driver.get(url)

# sleep 2

# html = driver.page_source

html = File.read('santamaria.html')

page = Nokogiri::HTML(html)

hash = {}

page.css("p.nombre, p.precio span").each do |element|
  current_element = element.attributes.values[0]
  if current_element.nil?
    hash[hash.keys.last] = element.text.sub(/,/,".")[1..].to_f
  else
    case current_element.value
    when "nombre"
      hash[element.text.strip] = 0.0
    when "tachado"
      next
    end
  end
end

p hash

# page.css('p.precio span').each do |price|
#   p price.text if price.attributes.empty?
# end

# driver.quit
