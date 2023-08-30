require_relative "station"
require_relative "route"
require_relative "train"
require_relative "cargo_train"
require_relative "passenger_train"
require_relative "wagon"
require_relative "passenger_wagon"
require_relative "cargo_wagon"
class Main

  def initialize
    @wagons = []
    @routes = []
    @stations = []
    @trains = []
  end

  def start
    puts "Добро пожаловать на станцию управления железными дорогами"
    loop do
      menu
      choice = gets.chomp
      break if choice == "9"
      list(choice)
    end
  end

  private

  attr_reader :stations, :routes, :trains, :wagons

  def menu
    puts """
     1 - Cоздать станцию
     2 - Создать поезда
     3 - Создать маршрут или управлять станциями в существующем
     4 - Назначить маршрут поезду
     5 - Управление вагонами поезда
     6 - Перемещать поезд по маршруту
     7 - Показать список станций
     8 - Показать список поездов на станции
     9 - Прекратить работу станции управления железными дорогами
    """
  end

  def list(ch)
    create_station if ch == "1"

    create_train if ch == "2"

    route_management if ch == "3"

    appoint_route if ch == "4"

    wagon_management if ch == "5"

    train_moving if ch == "6"

    show_stations if ch == "7"

    show_trains if ch == "8"
  end

  def create_station
    begin
      print "Вы зашли в отдел по созданию станций. Пожалуйста, выберите название "
      name = gets.chomp
      station = Station.new(name)
    rescue
      retry
    else
      @stations << station
      puts "Станция #{name} создана"
    end
  end

  def create_train
    begin
      print "Вы зашли в отдел по созданию поездов. Пожалуйста, введите номер "
      num = gets.chomp
      puts "Выберите какого типа поезд будете создавать"
      puts """
           0 - Грузовой
           1 - Пассажирский"""
      type = gets.chomp
      train = CargoTrain.new(num) if type == "0"
      train = PassengerTrain.new(num) if type == "1"
      @trains << train
      puts "Поезд #{train.inspect} под номером #{train.number} создан"
    rescue NoMethodError
      puts "Вы не ввели тип создаваемого поезда. Введите"
      retry
    rescue
      retry
    end
  end

  def route_management
    puts """Вы зашли в отдел управления маршрутами.
            Пожалуйста, выберите ваш варинт действия
            1 - Создать маршрут
            2 - Добавить станцию в существующем маршруте
            3 - Удалить станцию в существующем маршруте"""
    num = gets.chomp
    create_route if num == "1"
    add_station_in_route if num == "2"
    del_station if num == "3"
  end

  def create_route
    puts "Вы вошли в отдел создания маршрутов. Введите начальную и конечную станцию по очереди"
    firts_st = gets.chomp
    finish_st = gets.chomp
    route = Route.new(firts_st, finish_st)
    @routes << route
    puts "Маршрут #{route.inspect} создан"
  end

  def add_station_in_route
    puts "Выберите станцию по индексу, которую вы хотели бы добавить в маршрут"
    @stations.each_with_index{|item, index| puts "индекс - #{index} - станция -  #{item.name}"}
    station = @stations[gets.chomp.to_i]
    puts "Выберите маршрут по индексу, в которую вы хотели бы добавить станцию"
    @routes.each_with_index{|item, index| puts "индекс - #{index} - маршрут - #{item.inspect}"}
    route = @routes[gets.chomp.to_i]
    route.add_station(station)
    puts "Станция #{station.name} добавлена в маршрут #{route.inspect}"
  end

  def del_station
    puts "Выберите станцию по индексу, которую вы хотели бы удалить из маршрута"
    @stations.each_with_index{|item, index| puts "индекс - #{index} - станция -  #{item}"}
    station = @stations[gets.chomp.to_i]
    puts "Выберите маршрут по индексу, в котором вы хотели бы удалить станцию"
    @routes.each_with_index{|item, index| puts "индекс - #{index} - маршрут - #{item.inspect}"}
    route = @routes[gets.chomp.to_i]
    route.del_station(station)
    puts "Станция #{station.name} удалена из маршрута #{route.inspect}"
  end

  def appoint_route
    puts "Выберите поезд для назначения на маршрут по индексу"
    @trains.each_with_index{|item, index| puts "индекс - #{index} - поезд -  #{item.num}"}
    train = @trains[gets.chomp.to_i]
    puts "Теперь выберите нужный вам маршрут по индексу"
    @routes.each_with_index{|item, index| puts "индекс - #{index} - маршрут - #{item.inspect}"}
    route = @routes[gets.chomp.to_i]
    train.take_route(route)
    puts "Поезд #{train.num} назначен на маршрут #{route.inspect}"
  end

  def wagon_management
    puts "Добро пожаловать в отдел управления вагонами. Выберите нужный вам варинт действий"
    print """
              0 - Создать вагон
              1 - Добавить вагон к поезду
              2 - Отцепить вагон от поезда
              """
    num = gets.chomp
    create_wagon if num == "0"

    if num == "1"
      puts "Выберите поезд по индексу, к которому будете добавлять вагон"
      @trains.each_with_index{|item, index| puts "индекс - #{index} - поезд -  #{item.num}"}
      train = @trains[gets.chomp.to_i]
      add_wagon(train)
    end

    if num == "2"
      puts "Выберите поезд по индексу, с которого будете отцеплять вагон"
      @trains.each_with_index{|item, index| puts "индекс - #{index} - поезд -  #{item.num}"}
      train = @trains[gets.chomp.to_i]
      del_wagon(train)
    end
  end

  def create_wagon
    puts "Выберите какой какого типа вагон будете прицеплять к поезду"
    puts """
         0 - Грузовой
         1 - Пассажирский"""
    type = ["cargo", "passenger"][gets.chomp.to_i]
    wagon = type == "cargo"? CargoWagon.new : PassengerWagon.new
    @wagons << wagon
    puts "Вагон #{wagon.inspect} создан"
  end

  def add_wagon(train)
    puts "Выберите вагон по иднексу для добавленияя к поезду"
    @wagons.each_with_index{|item, index| puts "индекс - #{index}, вагон - #{item.inspect}"}
    wagon = @wagons[gets.chomp.to_i]
    if train.type == wagon.type
      train.add_wagon(wagon)
      puts "Вагон #{wagon.inspect} прицеплен к поезду #{train.num}"

    else
      puts "Вы не можете прицепить вагон, тип которого отличается от типа поезда"
    end
  end

  def del_wagon(train)
    puts "Выберите вагон по иднексу для отцепления от поезда"
    train.wagons.each_with_index{|item, index| puts "индекс - #{index}, вагон - #{item.inspect}"}
    wagon = @wagons[gets.chomp.to_i]
    train.del_wagon(wagon)
    puts "Вагон #{wagon.inspect} отцеплен от поезда #{train.num}"
  end

  def train_moving
    puts "Вы зашли в отдел управления движениями. Выберите поезд по индексу для управления его движением"
    @trains.each_with_index{|item, index| puts "индекс - #{index} - поезд -  #{item.num}"}
    train = @trains[gets.chomp.to_i]
    puts "Выберите действие, которое хотите осуществить"
    puts """
         1 - Ехать вперед
         2 - Сдать назад
        """
    num = gets.chomp
    num == 1? train.go_next_station : train.go_previous_station
    puts "Поезд #{train.num} переместился со станции #{train.previous_station.name} на станцию #{train.current_station}" if num == "1"
    puts "Поезд #{train.num} переместился со станции #{train.current_station} на станцию #{train.previous_station.name}" if num == "2"
  end

  def show_stations
    puts "Вы зашли в отдел просмотра станций"
    @stations.each{|i| puts "Станция - #{i.name}"}
  end

  def show_trains
    puts "Вы зашли в отдел просмотра поездов. Выберите станцию по индексу, на которой хотите смотреть поезда"
    @stations.each_with_index{|item, index| puts "индекс - #{index} - станция -  #{item.name}"}
    station = @stations[gets.chomp.to_i]
    station.trains.each{|train| puts "Поезд номер - #{train.num}"}
  end
end
a = Main.new
a.start

