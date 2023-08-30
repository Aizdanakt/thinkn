require_relative "instance_counter"
require_relative "valid_check"
class Station
  include InstanceCounter
  include ValidCheck
  attr_reader :trains, :name
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select {|train| train.type == type}.count
  end

  def self.all
    @@stations
  end
  private

  def validate!
    errors = []
    errors << puts("Имя не может быть пустым!") if name == ""
    errors << puts("Имя не может быть менее 3 символов!") if name.length < 3
    raise errors.join(".") unless errors.empty?
  end
end