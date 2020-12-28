
class Stock
    attr_accessor :long_business_summary, :short_name

    @@all = []

    def initialize(summary, short_name)
        @long_business_summary = summary
        @short_name = short_name
        save
    end

    def save
        @@all = []
        @@all << self
    end

end