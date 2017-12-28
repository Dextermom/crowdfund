require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

class Collection

  def initialize(title)
    @title = title
    @collection = []
  end

  def add_projects(a_project)
    @collection.push(a_project)
  end

  def funding_cycle
    puts "There are #{@collection.size} projects in #{@title.capitalize}"
    @collection.each do |project|
      puts project
    end

    @collection.each do |project|
        FundingRound.fund_round(project)
        puts project
    end
  end
end

if __FILE__ == $0
  project1 = Project.new("test", 100, 50)
  collection1 = Collection.new("practice")
  collection1.add_projects(project1)
  collection1.funding_cycle
end
