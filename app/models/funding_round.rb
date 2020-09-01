class FundingRound
    attr_accessor :startup, :type, :investment
    attr_reader :venture_capitalist
    @@all = []
    def initialize(startup, venture_capitalist, type, investment=0)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        self.class.all << self
    end

    def self.all
        @@all
    end

    
end
