require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'route'
require_relative 'station'

def start_menu
  puts 'Введите номер пункта меню:'
  puts '1. Создать станцию'
  puts '2. Создать поезд'
  puts '3. Работать с существующим поездом'
  puts '4. Показать все станции и поезда'

  selection = gets.to_i

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

def create_station
end

def create_train
end

def edit_train
end

def list_all
end
