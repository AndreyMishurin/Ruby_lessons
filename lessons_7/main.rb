require_relative 'company_name'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'route'
require_relative 'station'

class Main

  attr_accessor :stations, :index_stations, :trains, :index_trains

def initialize
  @stations = {}
  @index_stations = 0
  @trains = {}
  @index_trains = 0
end

def start_menu
  puts 'Введите номер пункта меню:'
  puts '1. Создать станцию'
  puts '2. Создать поезд'
  puts '3. Использовать текущий поезд'
  puts '4. Показать все станции и поезда'

  selection = gets.chomp.to_i

  case selection
    when 1
      create_station
    when 2
      create_train
    when 3
      edit_train
    when 4
      list_all
    else
      puts 'Неверный ввод'
      exit
  end
end

private

def create_station
  while true
    puts 'Для выхода из процедуры просто нажмите Enter, оставив название станции пустым'
    puts 'Для создания станции введите еe название:'
    print ' > '
    name = gets.strip
    if name == ''
      puts stations
      start
    else
      stations[index_stations] = Station.new(name)
      index_stations += 1
    end
end

def create_train
  @trains ||= {}
  @index_trains ||= 0

  while true
    puts 'Тип поезда:'
    puts '1. Грузовой'
    puts '2. Пассажирский'
    puts 'Для выхода из процедуры просто нажмите Enter'
    print ' > '
    choice = gets.to_i

    case choice
      when 1
        puts 'Cоздаем грузовой поезд, введите номер:'
        print ' > '
        number = gets.strip
        @trains[@index_trains] = CargoTrain.new(number)
        @index_trains += 1
      when 2
        puts 'Cоздаем пассажирский поезд, введите номер:'
        print ' > '
        begin
          number = gets.strip
          @trains[@index_trains] = PassengerTrain.new(number)
          @index_trains += 1
          puts "Создан поезд с номером #{}."
        rescue RuntimeError => e
          puts e.message
          retry
        end
      when 0
        puts @trains
        start
    end
  end
end

def edit_train
  while true
    puts "Список поездоа #{@trains}"
    puts 'Введите порядковый номер поезда'
    print ' > '
    choice = gets.chomp.to_i

    if @trains.has_key?(choice)
      train = @trains[choice]
    else
      puts 'Поезд с таким номером не существует'
      start
    end

    puts "Выбран поезд #{train}"
    puts '1. Прицепить вагон.'
    puts '2. Отцепить вагон.'
    puts '3. Отправить поезд на станцию'
    print ' > '
    choice = gets.chomp.to_i

    case choice
      when 0
        puts 'Неверный номер'
        start
      when 1
        if train.cargo?
          train.add_wagon(CargoWagon.new)
        else
          train.add_wagon(PassengerWagon.new)
        end
      when 2
        train.del_wagon
      when 3
        puts "У нас есть следующие станции: #{stations}"
        puts 'Введите порядковый номер станции (перед знаком =>)'
        print ' > '
        choice = gets.chomp.to_i

        if stations.has_key?(choice)
          station = stations[choice]
        else
          puts 'Станция с таким порядковым номером не существует'
          start
        end

        station.arrive_train(train)

    end
  end
end

def create_wagon(train)
  if train.cargo?
    puts 'Выбран грузовой тип вагона. Введите объем вагона:'
    volume = gets.to_i
    train.add_wagon(CargoWagon.new(volume))
  else
    puts 'Выбран пассажирский тип вагона. Введите количество мест в вагоне:'
    seats = gets.to_i
    train.add_wagon(PassengerWagon.new(seats))
end

def show_wagon(train)
  i = 1
  train.take_block do |wagon|
    puts "Вагон #{i}, #{wagon.type}"
    puts "В вагоне занято мест: #{wagon.type == :cargo ? wagon.occupied_capacity : wagon.occupied_seats}"
    puts "В вагоне свободно мест: #{wagon.type == :cargo ? wagon.free_capacity : wagon.free_seats}"
  i += 1
  end
end

def print_station(stations)
  stations.each do |stations|
    puts "Станция #{station.name.upcase}. Расписание:"
    station.take_block do |train|
      puts "Поезд: #{train.number}, Тип: #{train.type}, Количество вагонов: #{train.wagons.size}"
      show_wagon(train) unless train.wagons.empty?
    end
  end
end

  def list_all
    puts "Все станции: #{stations}"
    puts "Все поезда: #{@trains}"
  end
end
end
