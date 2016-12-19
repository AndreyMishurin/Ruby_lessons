class Route
  attr_reader :stations

  def initialize(start_station, finish_station)
    @start_station = start_station
    @finish_station = finish_station
    validate!
    @stations = [start_station, finish_station]
  end

  def set_station(station)
    @stations.insert(-2, station)
  end

  def destroy_station(station)
    del_validate!
    @transit_stations.delete(station)
  end

  def show_station
    puts stations.split(', ')
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!(start_station, finish_station)
    raise 'Станция отправления должна быть типа Station' if start_station.class != Station
    raise 'Станция отправления должна быть типа Station' if finish_station.class != Station
    true
  end

  def del_validate!(start_station, finish_station)
    raise 'Вы не можете удалить начальную станцию' if @stations.include?(start_station)
    raise 'Вы не можете удалить конечную станцию' if @stations.include?(finish_station)
    true
  end
end
