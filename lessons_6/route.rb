class Route
  def initialize(start_station, finish_station)
    @start_station = start_station
    @finish_station = finish_station
    @stations = [start_station, finish_station]
  end

  def set_station(station)
    @stations.insert(-2, station)
  end

  def destroy_station(station)
    @transit_stations.delete(station)
  end

  def show_station
    puts stations.split(", ")
  end
end
