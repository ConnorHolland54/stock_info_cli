
class Stock
    attr_accessor :long_business_summary, :short_name, :sector, :country, :city, :website, :ticker

    @@all = []

    def initialize(summary, short_name)
        @long_business_summary = summary
        @short_name = short_name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

end