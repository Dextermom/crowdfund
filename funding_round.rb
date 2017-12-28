require_relative 'project'
require_relative 'die'

module FundingRound

  def self.fund_round(project)
    die = Die.new
    number_rolled = die.roll
    if number_rolled.even?
      project.add_funds
    else
      project.remove_funds
    end
  end
end
