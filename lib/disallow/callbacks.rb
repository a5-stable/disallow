
require 'disallow/exceptions'

module Disallow
  module Callbacks
    #
    # disallow specific callbacks
    # CALLBACKS = [
    #   :after_initialize, :after_find, :after_touch, :before_validation, :after_validation,
    #   :before_save, :around_save, :after_save, :before_create, :around_create,
    #   :after_create, :before_update, :around_update, :after_update,
    #   :before_destroy, :around_destroy, :after_destroy, :after_commit, :after_rollback
    # ]
    #
    ActiveRecord::Callbacks::CALLBACKS.each do |callback|
      kind, name = callback.to_s.split('_').map(&:to_sym)
      method_name = "disallow_#{callback}_callbacks!"
      flag_name = method_name.gsub("!", "")

      define_method(method_name) do |*args|
        if public_send("_#{name}_callbacks").any? { |c| c.kind == kind && c.name == name }
          raise Disallow::CallbackError.new(self.name, callback)
        end

        instance_variable_set("@#{flag_name}", true)
      end

      define_method(callback) do |*args|
        if instance_variable_get("@#{flag_name}")
          raise Disallow::CallbackError.new(self.name, callback)
        else
          super(*args)
        end
      end
    end

    # disallow all callbacks
    def disallow_callbacks!
      raise Disallow::CallbackError.new(self.name, nil)  if __callbacks.any?
    end
  end
end
