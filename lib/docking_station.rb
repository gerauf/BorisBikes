require_relative 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_accessor :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes = []
	end

	def release_bike
			fail "No bikes" if empty?
			bikes.each {|bike| return bike if bike.working? == true }
			raise "No working bikes"
	end

	def dock(bike)
		fail "Docking Station full" if full?
		bikes << bike
	end

	private
	attr_reader :bikes

	def full?
		bikes.count >= capacity
	end

	def empty?
		bikes.count == 0
	end
end
