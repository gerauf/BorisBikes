require 'docking_station'
require 'rspec/expectations'

describe DockingStation do
        #let(:bike)...
			it {is_expected.to respond_to(:release_bike)}
			it {is_expected.to respond_to(:dock).with(1).argument}
			# it {is_expected.to respond_to(:bikes)}

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
					it 'releases a bike' do
						bike = Bike.new
						subject.dock(bike)
						expect(subject.release_bike).to eq bike
          #  expect{subject.release_bike}.to raise_error("bike is broken")
					end



					end
					it "has a working bike" do
						bike = Bike.new
						subject.dock(bike)
           	expect(subject.release_bike.working?).to eq true
						#expect(subject.release_bike.working?).to eq false
					end
					it "raises exception if no bikes in docking station" do
						expect {subject.release_bike}.to raise_error("No bikes")
					end


			describe '#dock' do
					it "raises exception if docking station is full" do
						subject.capacity.times {subject.dock(Bike.new)}
						expect {subject.dock(Bike.new)}.to raise_error("Docking Station full")
						# it "reports broken when !(bike.working?)"
						# expect {subject.dock(Bike.new)}.to raise_error("Docking Station full")
					end
			end
end
