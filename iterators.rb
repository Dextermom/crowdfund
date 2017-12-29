def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end


def five_times
  1.upto(5) do |count|
    yield count
    end
  end

  def n_times(count)
    1.upto(count) do |count|
      yield count
    end
  end

conversation {puts "Good to meet you!"}
five_times do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
n_times(5) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
