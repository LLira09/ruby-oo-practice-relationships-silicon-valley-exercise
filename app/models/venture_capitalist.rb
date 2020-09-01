class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |t_worth|
            t_worth.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |vc|
            vc.venture_capitalist == self
        end
    end

    def portfolio
        names = funding_rounds.collect {|vc| vc.startup.name}
        names.uniq
    end

    def biggest_investment
        funding_rounds.max {|a, b| a.investment <=> b.investment}
    end

    def invested(domain)
        d_invest = funding_rounds.select {|d| d.startup.domain == domain}
        total = d_invest.collect {|i| i.investment}
        total.sum
    end
end
