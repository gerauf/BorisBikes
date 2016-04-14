require_relative 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_accessor :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes = []
	end

	def release_bike(bike)
			fail "No bikes" if empty?
			raise "bike is broken" if !(bike.working?)
			bikes.pop

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
