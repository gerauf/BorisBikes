class DockingStation
  attr_reader :bike

  def release_bike
    Bike.new
  end

  def dock(bike)
    bike
  end

  # def number_of_bikes
  #   @bikes
  # end
end

class Bike
  def working?
    true
  end
end
