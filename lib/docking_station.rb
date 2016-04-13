require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bike in dock!" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Dock is full!" if @bikes.count >= 20
    @bikes << bike
    bike
  end

end

# require './lib/docking_station.rb'
