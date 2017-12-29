require_relative 'project'
require_relative 'collection'


project1 = Project.new("abc",10000, 1000)
project2 = Project.new("lmn", 15000, 500)
project3 = Project.new("xyz", 25000)
project4 = Project.new("bbb", 50000, 100)

collection1 = Collection.new("nov_projects")
collection1.add_projects(project1)
collection1.add_projects(project2)
collection1.add_projects(project3)
collection1.add_projects(project4)

 collection1.funding_cycle(3)
 collection1.print_stats
