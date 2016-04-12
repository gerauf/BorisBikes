class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes left!" if @bikes == []
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station is full" if @bikes.size >= 20
    @bikes << bike
  end
end

class Bike
  def working?
    true
  end
end
