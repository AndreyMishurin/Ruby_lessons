class Train
  attr_reader :number
  attr_reader :type
  attr_reader :wagon_count

  def initialize(number, type = 'passanger', wagon_count = 1)
    @number = number
    @type = type
    @wagon_count = wagon_count
  end

  def acceleration
    @speed = 10
  end

  def speed
    @speed = speed()
  end

  def brake
    @speed = 0
  end

  def hitch
    wagon_count += 1 if speed = 0
  end

  def unhook
    wagon_count -= 1 if speed = 0
  end

  def way <<

  end

  def move

  end

end
