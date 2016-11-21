class Train
  attr_reader :number
  attr_reader :type
  attr_reader :wagon_count
  attr_accessor :speed

  def initialize(number, type, wagon_count = 1)
    @number = number
    @type = type
    @wagon_count = wagon_count
    @route = nil
    @count = 0
  end

  def speed_up
    @speed += 1
  end

  def brake
    @speed = 0
  end

  def add_wagon
    wagon_count += 1 if @speed = 0
  end

  def delete_wagon
    if @wagon > 0
    wagon_count -= 1 if @speed = 0
  end

  def route_train(route)
    @route = route
  end

  def next_station
    @count += 1 if @count != (@route.station.size - 1)
    end
  end

  def last_station
    @count -= 1 if @count != 0
  end

  def show_current_station
    @route.station[@count].name
  end

  def show_next_station
    @route.station[@count + 1].name if @count != (@route.station.size - 1)
  end

  def show_last_station
    @route.stations[@count - 1].name unless @count.zero?
  end
end
