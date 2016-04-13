require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    fail "No bike in dock!" unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
  end

end

# require './lib/docking_station.rb'
