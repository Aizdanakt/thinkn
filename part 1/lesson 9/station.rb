require_relative 'instance_counter'
require_relative 'valid_check'
require_relative 'validation'
class Station
  include InstanceCounter
  include Validation
  attr_reader :trains, :name

  @@stations = []

  validate :name, :presence
  validate :name, :type, String

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
    @trains.select { |train| train.type == type }.count
  end

  def self.all
    @@stations
  end

  def show_train(&block)
    @trains.each(&block)
  end
end
