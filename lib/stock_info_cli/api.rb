require 'uri'
require 'net/http'
require 'openssl'

require_relative 'stock.rb'


class API

    def get_info(ticker)
        url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary?symbol=#{ticker}&region=US")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = 'b0e7d09d5bmshdde539f61c9bee3p1b3418jsnb1c6e50d7b5c'
        request["x-rapidapi-host"] = 'apidojo-yahoo-finance-v1.p.rapidapi.com'

        response = http.request(request)
        response.read_body

        create_stock(response.read_body)
    end

    def create_stock(body)
        information = JSON.parse(body)
        stock = Stock.new(information["summaryProfile"]["longBusinessSummary"], information["quoteType"]["shortName"])
        stock.sector = information["summaryProfile"]["sector"]
        stock.city = information["summaryProfile"]["city"]
        stock.country = information["summaryProfile"]["country"]
        stock.website = information["summaryProfile"]["website"]
        return stock
    end
end