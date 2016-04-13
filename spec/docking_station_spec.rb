require 'docking_station'
describe DockingStation do
  # it "return true or false when called on bike" do
  # expect(subject).to respond_to :release_bike
  it { is_expected.to respond_to :release_bike }

  it "gets a bike" do
    bicycle = subject.release_bike
    expect(bicycle).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "docks a bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it "returns docked bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end