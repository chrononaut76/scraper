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

html = File.open('santamaria.html')

page = Nokogiri::HTML(html)

p page.css('p.nombre').text
p page.css('p.precio').text

# driver.quit
