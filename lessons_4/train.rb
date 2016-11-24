class Train
  attr_reader :number
  attr_reader :type
  attr_accessor :speed

  def initialize(number, type, speed, wagon_count = 1)
    @number = number
    @type = type
    @route = nil
    @wagon = []
    @count = 0
    @speed = speed
  end

  def speed_up(speed)
    @speed += 1
  end

  def brake
    @speed = 0
  end

  def add_wagon
    @wagon.push(wagon) if @speed = 0
  end

  def delete_wagon
    if @speed != 0
      @wagon.pop unless @wagon.empty?
    end
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

  def cargo?
    type == :cargo
  end

  def passenger?
    type == :passenger
  end

  private    #методы используемые внутри класса для проверки, снаружи не вызываем

  def braked?
    @speed == 0
  end

  def has_route?
    if @route
      true
    else
      puts 'Нет маршрута.'
      false
    end
  end

end
