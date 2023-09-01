module InstanceCounter

  def self.included(base)
    base.extend Quantity
    base.include Counter
  end

  module Quantity
    attr_accessor :quantity

    def instances
      @quantity
    end
  end

  module Counter

    private

    def register_instance
      self.class.quantity ||= -1
      self.class.quantity += 1
    end
  end
end
