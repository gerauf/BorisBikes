require_relative 'bike'

class DockingStation

	DEFAULT_CAPACITY = 20

	attr_accessor :capacity
	attr_reader :bikes

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@bikes = []
	end

	def release_bike
		fail "No bikes" if empty?
		bikes.each_with_index do |bike,index|
			return bikes.slice!(index) if bike.working?
		end
		raise "No working bikes"
	end

	def dock(bike)
		fail "Docking Station full" if full?
		bikes << bike
	end

	# need a method to except multiple bikes
	# need a method to release all broken bikes

	private


	def full?
		bikes.count >= capacity
	end

	def empty?
		bikes.count == 0
	end
end
