class Station
    attr_reader :name_station

    def initialize(name)
      @name_station = name
      @trains = []
    end

  def add_train(train)
    @trains << train
  end

  def show_trains(type)
    trains = []
    @trains.each {  |train| trains << train if train.type == 'freight' }
    trains.each { |train| puts train.name }
  end

  def dispatch_train

    trains.delete_at(train.name)
  end
end

