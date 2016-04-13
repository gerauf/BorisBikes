class DockingStation
  attr_reader :bikes, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes left!" if empty?
    @bikes.each {|bike| return bike if bike.working}
    raise "There are no working bikes left!"
  end

  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

  private
    def full?
      @bikes.size >= capacity
    end

    def empty?
      @bikes == []
    end

end

class Bike
  attr_accessor :working

  def initialize
    @working = true
  end

  def report_broken
    @working = false
  end


end
