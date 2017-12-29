require_relative 'project'
require_relative 'die'
require_relative 'pledge_pool'

module FundingRound

  def self.fund_round(project)
    die = Die.new
    number_rolled = die.roll
    if number_rolled.even?
      project.add_funds
    else
      project.remove_funds
    end
    pledge = PledgePool.random
    puts "Project #{project.name} received a #{pledge.name} pledge worth $#{pledge.amount}."
  end
end
