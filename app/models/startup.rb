class Startup
    attr_reader :founder
    attr_accessor :name, :domain 

    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(name)
        Startup.all.find {|f_name| f_name.founder == name}
    end

    def self.domains
        Startup.all.collect {|d| d.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        total = FundingRound.all.select do |s|
            s.startup == self
        end
        total.count
    end

    def total_funds
        funding = FundingRound.all.select do |s|
            s.startup == self
        end
        total = funding.collect {|f| f.investment}
        total.sum
    end

    def investors
        funding = FundingRound.all.select do |s|
            s.startup == self
        end
        vcs = funding.collect {|vc| vc.venture_capitalist.name }
        vcs.uniq
    end

    def big_investors
        self.investors && VentureCapitalist.tres_commas_club
    end
end
