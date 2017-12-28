require_relative 'collection'

describe Collection do
  before do
    $stdout = StringIO.new
  end

  before do
    @collection = Collection.new("sample")

    @target = 2000
    @project = Project.new("test", @target, 100)

    @collection.add_projects(@project)
  end

  it "add_funds to the project if an even number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(6)

    @collection.funding_cycle

    expect(@project.initial).to eq(100+25)
  end

  it "removes funds from the project if an odd number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(5)

    @collection.funding_cycle

    expect(@project.initial).to eq(100-15)    
  end
end
