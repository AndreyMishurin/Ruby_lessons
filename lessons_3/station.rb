class Station
  attr_reader :name_station

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
  end

  def dispatch_train(train)
    trains.delete(train) if trains
  end
end

