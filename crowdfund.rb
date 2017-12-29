require_relative 'project'
require_relative 'collection'


collection1 = Collection.new("nov_projects")
collection1.load_projects(ARGV.shift || "projects.csv")

loop do
  puts "\n How many funding rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    collection1.funding_cycle(answer.to_i)
  when 'quit', 'exit'
    collection1.print_stats
    break
  else
    puts "please enter a number or 'quit'"
  end
end

collection1.save_need_funds
