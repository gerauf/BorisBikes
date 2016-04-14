require 'docking_station'
describe DockingStation do
  # it "return true or false when called on bike" do
  # expect(subject).to respond_to :release_bike
  it { is_expected.to respond_to :release_bike }

  it "gets a bike from the docking station" do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "docks a bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it "able to set capacity" do
    station = DockingStation.new(5)
    expect(station.capacity).to eq 5
  end

  it "takes the default capacity of 20 when no arguments passed" do
    expect(DockingStation.new.capacity).to eq 20
  end

  describe "#release_bike" do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises error when no bike available" do
      expect { subject.release_bike}.to raise_error("No bike in dock!")
    end

    it "raises error if trying to release a broken bike" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error("All available bikes are broken")
    end

    it "if first bike is broken, release next bike" do
      broken_bike = Bike.new
      broken_bike.report_broken
      subject.dock(broken_bike)
      working_bike = Bike.new
      subject.dock(working_bike)
      expect(subject.release_bike).to eq working_bike
    end

    it "if there is a working bike, release it regardless of number of broken bikes" do
      working_bike = Bike.new
      subject.dock(working_bike)
      broken_bike = Bike.new
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect(subject.release_bike).to eq working_bike
    end
  end

  describe "#dock" do
    it "raises an error when dock is full" do
      subject.capacity.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error("Dock is full!")
    end
  end
end
