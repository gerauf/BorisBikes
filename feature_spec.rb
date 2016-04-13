require_relative './lib/docking_station.rb'
require_relative './lib/bike.rb'

station = DockingStation.new
bike = Bike.new


station1 = DockingStation.new(5)

p station.capacity
p station1.capacity
