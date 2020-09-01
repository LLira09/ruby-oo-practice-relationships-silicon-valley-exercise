require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Flow", "Jake", "flow.com")
s2 = Startup.new("Valorant", "Frank", "Valorant.com")
s3 = Startup.new("Hyper", "Sam", "hyper.com")

vc1 = VentureCapitalist.new("Bobby", 20000000)
vc2 = VentureCapitalist.new("Dan B", 1000000000)
vc3 = VentureCapitalist.new("Gary V", 10000000)
vc4 = VentureCapitalist.new("Grant C", 4000000000)

fr1 = FundingRound.new(s1, vc3, "Angel", 500000)
fr2 = FundingRound.new(s2, vc2, "Series-A", 200000)
fr3 = FundingRound.new(s3, vc4, "Series-C", 500000)
fr4 = FundingRound.new(s1, vc4, "Series-C", 500000)
fr4 = FundingRound.new(s1, vc4, "Series-C", 600000)
fr5 = FundingRound.new(s1, vc2, "Series-C", 3000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line