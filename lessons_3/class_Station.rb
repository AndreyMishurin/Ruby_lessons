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
   return @trains if type.nil?
  end

  def dispatch_train(train)
    trains.delete(train) if trains
  end
end

