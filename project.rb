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
