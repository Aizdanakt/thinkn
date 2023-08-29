require_relative "instance_counter"
class Station
  include InstanceCounter

  attr_reader :trains, :name
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
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
end


