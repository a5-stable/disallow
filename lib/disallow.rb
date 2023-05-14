require "disallow/version"
require "active_record"

module Disallow
  module Error
    class ValidationNotAllowed
    end
  end

  module Model
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      # disallow validation
      def disallow_validations!(options = {})
        if validators.any?
          raise Disallow::Error
        end
      end

      # disallow default scope
      def disallow_default_scope!(options = {})
        if default_scopes.present?
          raise Disallow::Error
        end

        @disallow_default_scope = true
      end

      def default_scope(*args)
        if @disallow_default_scope
          raise "error"
        end

        super(*args)
      end

      # disallow each callback
      ActiveRecord::Callbacks::CALLBACKS.each do |callback|
        kind, name = callback.to_s.split('_').map(&:to_sym)
        define_method "disallow_#{callback}_callback!" do
          if public_send("_#{name}_callbacks").any? { |c| c.kind == kind && c.name == name }
            raise Disallow::Error
          end
        end
      end

      # disallow all callbacks
      def disallow_callbacks!
      end
    end
  end
  ActiveRecord::Base.include Disallow::Model
end
