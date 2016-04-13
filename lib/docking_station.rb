require_relative 'bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bike in dock!" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Dock is full!" if full?
    @bikes << bike
    bike
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

end

# require './lib/docking_station.rb'
