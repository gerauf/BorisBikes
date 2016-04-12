require 'dockingstation.rb'

describe Bike do
  it "expects a bike to be working" do
    expect(Bike.new.working?).to eq true
  end
end
