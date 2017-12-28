require_relative 'project'
require_relative 'die'

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
      die = Die.new
      number_rolled = die.roll
        if number_rolled.even?
          project.add_funds
        else
          project.remove_funds
        end
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
