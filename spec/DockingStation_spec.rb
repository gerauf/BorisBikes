require 'dockingstation.rb'

describe DockingStation do
  it "DockingStation has to exist" do
    expect(DockingStation.new.class).to eq DockingStation
  end

  it "a bike has to be released when release_bike is called" do
    expect(DockingStation.new.release_bike.class).to eq Bike
  end

  it "expects that when a bike is released it will be working" do
    expect(DockingStation.new.release_bike.working?).to eq true
  end

  it "expects the Docking station to be able to dock a bike" do
    expect(DockingStation.new).to respond_to(:dock).with(1).argument
  end

   it "expects the Docking station to store a bike when it is docked" do
     expect(DockingStation.new).to respond_to(:bike)
   end

   it "Docking Station stores bikes " do
     bike = Bike.new
     expect(subject.dock(bike)) == bike
   end



end
