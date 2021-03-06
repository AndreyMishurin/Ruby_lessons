class Train
  include Company_name
  include TakeBlock

  attr_reader :number
  attr_reader :type
  attr_accessor :speed

  @@trains = {}

  NUMBER_FORMAT = /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/

  def initialize(_number, type, speed, _wagon_count = 1)
    @number = params[:number]
    @type = type
    @route = nil
    @wagons = []
    @count = 0
    @speed = speed
    validate!
    @@trains[@number] = self
  end

  def self.find(number)
    @@trains[number]
  end

  def take_block
    @wagons.each { |wagon| yield(wagon) }
  end

  def speed_up(_speed)
    @speed += 1
  end

  def brake
    @speed = 0
  end

  def add_wagon(wagon)
    if @speed.zero?
      return if type != wagon.type
      @wagons << wagon
    else
      false
    end
  end

  def delete_wagon
    if @speed != 0
      @wagons.pop unless @wagons.empty?
    end
  end

  def route_train(route)
    @route = route
  end

  def next_station
    @count += 1 if @count != (@route.station.size - 1)
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

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise 'Номер поезда не может быть короче 5 символов' if number.to_s.size < 5
    raise 'Номер поезда имеет неправильный формат' if number !~ NUMBER_FORMAT
    true
  end

  private # методы используемые внутри класса для проверки, снаружи не вызываем

  def braked?
    @speed.zero?
  end

  def route?
    if @route
      true
    else
      false
    end
  end
end
