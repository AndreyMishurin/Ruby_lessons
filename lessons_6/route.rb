class Route
  def initialize(start_station, finish_station)
    @start_station = start_station
    @finish_station = finish_station
    @stations = [start_station, finish_station]
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

protected

  def del_validate!
    raise "Вы не можете удалить начальную или конечную станцию" if @start_station == @stations || @finish_station == @stations
    true
  end

end
