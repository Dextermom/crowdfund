require_relative 'project'

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

if __FILE__ == $0
  project1 = Project.new("test", 100, 50)
  collection1 = Collection.new("practice")
  collection1.add_projects(project1)
  collection1.funding_cycle
end
