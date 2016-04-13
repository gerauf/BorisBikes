require 'dockingstation.rb'

describe DockingStation do
  it "DockingStation has to exist" do
    expect(DockingStation.new.class).to eq DockingStation
  end

  it "expects the Docking station to be able to dock a bike" do
    expect(DockingStation.new).to respond_to(:dock).with(1).argument
  end

  it "expects the Docking station to store a bike when it is docked" do
     expect(DockingStation.new).to respond_to(:bikes)
  end

  it "Docking Station stores bikes " do
     bike = Bike.new
     expect(subject.dock(bike)) == [bike]
  end


  describe '#release_bike' do

    it 'releases a bike after one has been added' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "will raise an error when a customer takes a bike from an empty docking station" do
      expect { DockingStation.new.release_bike}.to raise_error('There are no bikes left!')
    end
  end


  describe '#dock' do
    it 'expects an error to raise when docking at a station at max cap' do
      docking_station = DockingStation.new
      expect {(DockingStation::DEFAULT_CAPACITY+1).times { docking_station.dock Bike.new }}.to raise_error('Docking station is full')
    end
  end

end
