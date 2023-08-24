class Train
  attr_reader :wagons, :num, :type, :speed

  def initialize(num, type, wagons)
    @num = num
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def add_speed
    @speed += 1
  end

  def return_speed
    @speed -= 1
  end

  def brake_speed
    @speed = 0
  end

  def hook_wagon
    @wagons += 1 if @speed == 0
  end

  def unhook_wagon
    @wagons -= 1 if @speed == 0
  end

  def take_route(route)
    @route = route
    @current_station = @route.stations.first
  end

  def next_station
    @current_station = @route.stations[@route.stations.index(@current_station) + 1] #нашли индекс элемента текущей станции и добавили +1, чтобы перейти к следующей
  end

  def previous_station
    @current_station = @route.stations[@route.stations.index(@current_station) - 1]
  end

  def show_route
    [@route.stations[@route.stations.index(@current_station) - 1], @current_station,
     @route.stations[@route.stations.index(@current_station) - 1]]
  end
end
