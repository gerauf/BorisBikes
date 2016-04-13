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

    it 'will not release a bike if the only bike is broken' do
      bike = Bike.new
      subject.dock(bike, 'broken')
      expect { subject.release_bike}.to raise_error('There are no working bikes left!')
    end

    it 'will release a bike if there is a working bike' do
      bike = Bike.new
      bike2 = Bike.new
      subject.dock(bike, 'broken')
      subject.dock(bike2)
      expect(subject.release_bike).to eq bike2
    end

    it 'will release a working bike if there is a working bike' do
      bike = Bike.new
      bike2 = Bike.new
      subject.dock(bike)
      subject.dock(bike2, 'broken')
      expect(subject.release_bike.working).to eq true
    end

  end


  describe '#dock' do
    it 'expects an error to raise when docking at a station at max cap' do
      docking_station = DockingStation.new
      expect {(DockingStation.new(25).capacity+1).times { docking_station.dock Bike.new }}.to raise_error('Docking station is full')
    end

    it 'expects that a bikes status can be reported when docked' do
      bike = Bike.new
      expect(DockingStation.new.dock(bike, "")).to eq [bike]
    end

    it 'expects a bikes working attribute to change to false if the status is reported as "broken"' do
      bike = Bike.new
      docking_station = DockingStation.new
      docking_station.dock(bike,"broken")
      expect(docking_station.bikes[0].working).to eq false
    end
  end

  it 'expects docking station to be able to initialize with 1 argument' do
    expect(DockingStation.new(25).capacity).to eq 25
  end

  it 'expects new instance of docking station without an argument to default to 20' do
    expect(DockingStation.new.capacity).to eq 20
  end






end
