require_relative "company"
require_relative "valid_check"
require_relative "instance_counter"

class Train
  include InstanceCounter
  include Company
  include ValidCheck
  attr_reader :wagons, :type, :speed, :number, :current_station
  @@trains = []
  NUMBER_FORMAT = /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}/

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    validate!
    @@trains << self
    register_instance
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

  def self.find(num)
    @@trains.find { |train| train.number == num }
  end

  def show_wagon(&block)
    @wagons.each{|wagon| block.call(wagon)}
  end

  protected

  def validate!
    errors = []
    errors << "Номер не может быть пустым!" if number == "" || number.nil?
    errors << "Номер должен соответствовать формату!" if number !~ NUMBER_FORMAT && (number != "" && number != nil)
    raise errors.join(".") unless errors.empty?
  end
end
