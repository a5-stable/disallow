require "disallow/version"
require "active_record"

module Disallow
  class Error < StandardError; end
  # Your code goes here...

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
      def disallow_default_scopes!(options = {})
        if default_scopes.present?
          raise Disallow::Error
        end
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
        binding.irb
      end
    end
  end
  ActiveRecord::Base.include Disallow::Model
end
