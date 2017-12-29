require_relative 'project'
require_relative 'die'
require_relative 'funding_round'
require_relative 'pledge_pool'

class Collection

  def initialize(title)
    @title = title
    @collection = []
  end

  def add_projects(a_project)
    @collection.push(a_project)
  end

  def funding_cycle(rounds)
    puts "There are #{@collection.size} projects in #{@title.capitalize}"
    @collection.each do |project|
      puts project
    end

    pledges = PledgePool::PLEDGES
    puts "There are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "A #{pledge.name} pledge is worth $#{pledge.amount}."
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @collection.each do |project|
        FundingRound.fund_round(project)
        end
    end
  end

  def print_name_and_funding(project)
    puts "#{project.name} ($#{project.initial})"
  end
  def print_stats
    funded, not_funded = @collection.partition {|project| project.funded?}

    puts "\n#{@title} Statistics:"

    puts "\n#{funded.size} projects are fully funded:"
    funded.each do |project|
      print_name_and_funding(project)
    end

    puts "\n#{not_funded.size} projects still need funds:"
    not_funded.each do |project|
      print_name_and_funding(project)
    end

    sorted_projects = not_funded.sort {|a,b| b.funding_needed <=> a.funding_needed}

    puts "\n#{sorted_projects.size} projects still needing funding:"

    sorted_projects.each do |project|
      formatted_name = project.name.ljust(20,'.')
      puts "#{formatted_name} $#{project.funding_needed}"
      end
    end
  end


if __FILE__ == $0
  project1 = Project.new("test", 100, 50)
  project2 = Project.new("test2", 500)
  collection1 = Collection.new("practice")
  collection1.add_projects(project1)
  collection1.add_projects(project2)
  collection1.funding_cycle(2)
  collection1.print_stats
end
