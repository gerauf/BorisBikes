class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes left!" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

  private
    def full?
      @bikes.size >= 20
    end

    def empty?
      @bikes == []
    end

end

class Bike
  def working?
    true
  end
end
