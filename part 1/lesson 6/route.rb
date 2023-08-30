require_relative "instance_counter"
require_relative "valid_check"
class Route
  include InstanceCounter
  include ValidCheck
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  private

  def validate!
    errors = []
    errors << puts("Вы не ввели достаточное количество станций!") if stations[0] == "" || stations[1] == ""
    errors << puts("Название обеих станций должно быть не менее 3 символов") if stations[0].size < 3 || stations[1].size < 3
    raise errors.join(".") unless errors.empty?
  end
end
