require_relative 'instance_counter'
class Route
  include InstanceCounter
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
    errors << 'Вы не ввели достаточное количество станций!' if stations[0] == '' || stations[1] == ''
    if (stations[0].name.size < 3 || stations[1].name.size < 3) && (stations[0] != '' && stations[1] == '')
      errors << 'Название обеих станций должно быть не менее 3 символов'
    end
    raise errors.join('.') unless errors.empty?
  end
end
