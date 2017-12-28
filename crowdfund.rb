
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

project1 = Project.new("abc",10000, 1000)
project2 = Project.new("lmn", 15000, 500)
project3 = Project.new("xyz", 25000)

 nov_projects = [project1, project2, project3]
 puts "There are #{nov_projects.size} projects active in November"

 nov_projects.each do |project|
   puts project
 end

 nov_projects.each do |project|
   puts project.target
 end

 nov_projects.each do |project|
   project.add_funds
   project.add_funds
   project.remove_funds
   puts project
 end

 nov_projects.pop
 project4 = Project.new("bbb", 50000, 100)
 nov_projects.push(project4)
 puts nov_projects
