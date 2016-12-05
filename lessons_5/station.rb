class Station
  attr_writer :name_station
  attr_reader :trains_list

  @@trains_list = []

  def initialize(name)
    @name_station = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def show_trains(type = nil)
    @trains if type.nil?
  end

  def show_trains_type(type)
    count_train = 0
    @trains.each {|train| count_train +=1 if train.type == type}
    puts "Количество поездов типа #{type}: #{count_train}."
  end

  def dispatch_train(train)
    trains.delete(train) if trains
  end

  def self.all
    @@trains_list
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Название станции не может быть пустым" if name == ''
  end
end

