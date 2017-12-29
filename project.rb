require_relative 'pledge_pool'

class Project

  attr_accessor :name
  attr_reader :target
  attr_accessor :initial

  def initialize(name, target, initial=0)
    @name = name.upcase
    @target = target
    @initial = initial
    @pledges_received = Hash.new(0)
  end

  def self.from_csv(string)
    name, target, initial = string.split(',')
    Project.new(name, Integer(target), Integer(initial))
  end

  def to_s
    "Project #{@name} has $#{@initial} in funding and an outstanding balance of $#{funding_needed} towards a goal of $#{@target}"
  end

  def add_funds
    @initial += 25
    puts "Project #{@name} got more funds!"
  end

  def remove_funds
    @initial -= 15
    puts "Project #{@name} lost some funds!"
  end

def add_pledges
  @initial += @pledges_received.values.reduce(0, :+)

end
  def funding_needed
    @target-@initial
  end

  def funded?
    @initial >= @target
  end

  def receive_pledge(pledge)
    @pledges_received[pledge.name] += pledge.amount
    puts "Project #{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "Project #{@name}'s pledges: #{@pledges_received}"
  end

  def total_pledges
    @pledges_received.values.reduce(0, :+)
  end

  def each_pledge_received
    @pledges_received.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end
end

if __FILE__ == $0
project = Project.new("test", 100, 50)
puts project.name
puts project.target
puts project.initial
project.add_funds
puts project.initial
project.remove_funds
puts project.initial
end
