class DockingStation
  attr_reader :bike

  def release_bike
    raise "There are no bikes left!" unless @bike
    @bike
  end

  def dock(bike)
    raise "Docking station is full" if @bike
    @bike = bike
  end
end

class Bike
  def working?
    true
  end
end
