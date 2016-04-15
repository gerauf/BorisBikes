require 'docking_station'
require 'rspec/expectations'

describe DockingStation do
	let(:bike) {double :bike, working?: true}
	let(:bike_broken) {double :bike_broken, working?: false}

	it {is_expected.to respond_to(:release_bike)}
	it {is_expected.to respond_to(:dock).with(1).argument}

	describe '#initialize' do
		it "has a variable capacity" do
			capacity = 123
			station = DockingStation.new(capacity)
			expect(station.capacity).to eq capacity
		end
		it "sets the the capacity to default value when capacity is not provided" do
			expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
		end
	end

	describe '#release_bike' do

		it "has a working bike" do
      # allow(bike).to receive(:working?).and_return(true)
			subject.dock(bike)
     	expect(subject.release_bike.working?).to eq true
	  end

		it "raises exception if no bikes in docking station" do
			expect {subject.release_bike}.to raise_error("No bikes")
		end

		it 'raises an error if trying to release a broken bike' do
			# allow(bike_broken).to receive(:working?).and_return(false)
			subject.dock(bike_broken)
			expect {subject.release_bike}.to raise_error("No working bikes")
		end

		it "will release a bike as long as there is a working bike available" do
		  # allow(bike).to receive(:working?).and_return(true)
      # allow(bike_broken).to receive(:working?).and_return(false)
			subject.dock(bike_broken)
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it "after a bike has been released it will not exist in the bikes array anymore" do
			subject.dock(bike)
			subject.release_bike
			expect(subject.bikes).to eq []
		end

	end

	describe '#dock' do
		it "raises exception if docking station is full" do
			subject.capacity.times {subject.dock(bike)}
			expect {subject.dock(bike)}.to raise_error("Docking Station full")
		end
	end
end
