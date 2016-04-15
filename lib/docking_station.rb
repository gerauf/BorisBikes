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
			raise "No working bikes" if bikes.find{|bike| bike.working?} == nil
			bikes.each_with_index do |bike,index|
				return bikes.slice!(index) if bike.working?
			end
	end

	def dock(bike)
		fail "Docking Station full" if full?
		bikes << bike
	end

	private


	def full?
		bikes.count >= capacity
	end

	def empty?
		bikes.count == 0
	end
end
