module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module InstanceMethods

    def validate!
      self.class.validations.each do |val|
        attr = instance_variable_get("@#{val[:number]}".to_sym)
        send("#{val[:type]}_validate", attr, val[:args])

      end
    end

    def presence_validate(attr, _)
      raise 'Атрибут не может быть пустым!' if attr == '' || attr.nil?
    end

    def format_validate(attr, arg)
      raise 'Атрибут должен соответствовать формату!' if attr !~ arg
    end

    def type_validate(attr, arg)
      raise "Тип не соответствует заданному классу! #{attr.class} #{arg}" if [attr.class] != arg
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end

  module ClassMethods
    attr_accessor :validations

    def validate(number, type, *args)
      @validations ||= []
      @validations << { number: number, type: type, args: args}
    end
  end

  end