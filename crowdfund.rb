
class Project

  attr_accessor :name
  attr_reader :target
  attr_accessor :initial

  def initialize(name, target, initial=0)
    @name = name.upcase
    @target = target
    @initial = initial
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

  def funding_needed
    @target-@initial
  end
end

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
      project.add_funds
      project.add_funds
      project.remove_funds
      puts project
    end
  end
end
project1 = Project.new("abc",10000, 1000)
project2 = Project.new("lmn", 15000, 500)
project3 = Project.new("xyz", 25000)
project4 = Project.new("bbb", 50000, 100)

collection1 = Collection.new("nov_projects")
collection1.add_projects(project1)
collection1.add_projects(project2)
collection1.add_projects(project3)
collection1.add_projects(project4)

 collection1.funding_cycle
