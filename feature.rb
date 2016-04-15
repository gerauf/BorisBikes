require_relative './lib/docking_station.rb'
require_relative './lib/bike.rb'

p station = DockingStation.new
p bike = Bike.new

p 20.times{station.dock(bike)}

p new_station = DockingStation.new(34)
p broken = !(bike.working?)

# if docking station is not full -> dock bike (regardless if broken or not) -> if bike.working? is false -> return "Reporting bike broken"

# if bike.working if false -> docking station will not release_bike (need to keep track of the bikes which are broken and not)
