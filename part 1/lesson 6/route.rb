require_relative "instance_counter"
class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    register_instance
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def valid?
    begin
      validate!
    rescue
      false
    else
      true
    end
  end

  private

  def validate!
    raise puts "Вы не ввели достаточное количество станций!" if stations[0] == "" || stations[1] == ""
    raise puts "Название обеих станций должно быть не менее 3 символов" if stations[0].size < 3 || stations[1].size < 3
  end
end
