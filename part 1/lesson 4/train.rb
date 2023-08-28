class Train
  attr_reader :wagons, :type, :speed, :num

  def initialize(num)
    @num = num
    @wagons = []
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

  def take_route(route)
    @route = route
    @current_station = @route.stations.first
  end

  def go_next_station
    @current_station = @route.stations[@route.stations.index(@current_station) + 1]
  end

  def go_previous_station
    @current_station = @route.stations[@route.stations.index(@current_station) - 1]
  end

  def previous_station
    return unless @route
    @route.stations[@route.stations.index(@current_station) - 1]
  end

  def current_station
    return unless @route
    @current_station
  end

  def next_station
    return unless @route
    @route.stations[@route.stations.index(@current_station) +1]
  end

  def add_wagon(wagon)
    if speed == 0 && type == wagon.type
      @wagons << wagon
    end
  end

  def del_wagon(wagon)
    if speed == 0 && type == wagon.type
      @wagons.delete(wagon)
    end
  end

end
