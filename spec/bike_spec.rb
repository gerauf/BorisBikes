require 'dockingstation.rb'

describe Bike do
  it "expects the working attribute of a new bike to be set to true" do
    expect(Bike.new.working).to eq true
  end

  it "expects the working attribute of a bike to be able to be set to false" do
    bike = Bike.new
    bike.working = false
    expect(bike.working).to eq false
  end

  it 'expects a bikes working attribute to change to false if the bike is reported broken' do
    subject.report_broken
    expect(subject.working).to eq false
  end
end
