module Fundable

  def add_funds
    self.initial += 25
    puts "Project #{name} got more funds!"
  end

  def remove_funds
    self.initial -= 15
    puts "Project #{name} lost some funds!"
  end

  def funded?
    initial >= target
  end
end
