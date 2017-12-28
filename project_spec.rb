require_relative 'project'

describe Project do

  before do
    @target = 2000
    @project = Project.new("spec", @target)
  end

  before do
    $stdout = StringIO.new
  end
  it "has an initial target funding amount" do
    expect(@project.target).to eq(2000)
  end

  it "computes the total funding outstanding as the target funding amount minus the funding amount" do
    expect(@project.funding_needed).to eq(2000+0)
  end

  it "increases funds by 25 when funds are added" do
    @project.add_funds

    expect(@project.initial).to eq(0+25)
  end

  it "decreases funds by 15 when funds are removed" do
    @project.remove_funds

    expect(@project.initial).to eq(-15)
  end

  it "has a default value of 0 for funding amount" do
    expect(@project.initial).to eq(0)
  end

context "with initial funding equal to target" do
  before do
    @project = Project.new("testy", 200,200)
  end
  it "is fully funded" do
    expect(@project).to be_funded
    end
  end

  context "with initial funding less than target"do
    before do
      @project = Project.new("tester", 200, 100)
    end
    it "is underfunded" do
      expect(@project).not_to be_funded
      end
  end
end
