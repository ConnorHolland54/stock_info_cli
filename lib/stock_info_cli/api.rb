require 'uri'
require 'net/http'
require 'openssl'

require_relative 'stock.rb'


class API

    def self.get_info(ticker)
        url = URI("https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary?symbol=#{ticker}&region=US")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
        request["x-rapidapi-host"] = ENV['X_RAPIDAPI_HOST']

        response = http.request(request)
        response.read_body

        if valid_json?(response.read_body) == false
            puts "Invalid ticker symbol, please enter a new one."
            input = gets.strip
            get_info(input)
        else
            create_stock(response.read_body)
        end
    end

    def self.create_stock(body)
            information = JSON.parse(body)
            stock = Stock.new(information["summaryProfile"]["longBusinessSummary"], information["quoteType"]["shortName"])
            stock.sector = information["summaryProfile"]["sector"]
            stock.city = information["summaryProfile"]["city"]
            stock.country = information["summaryProfile"]["country"]
            stock.website = information["summaryProfile"]["website"]
            return stock
    end

    def self.valid_json?(string)
        !!JSON.parse(string)
      rescue JSON::ParserError
        false
    end

    



end