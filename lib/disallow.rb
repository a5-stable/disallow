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
      def disallow_validations!(options = {})
        binding.irb
        if __callbacks[:validate].present?
          raise Disallow::Error
        end
      end

      def disallow_default_scopes!(options = {})
        if default_scopes.present?
          raise Disallow::Error
        end
      end

      ActiveRecord::Callbacks::CALLBACKS.each do |callback|
        kind, name = callback.to_s.split('_').map(&:to_sym)
        define_method "disallow_#{callback}_callback!" do
          if public_send("_#{name}_callbacks").any? { |c| c.kind == kind && c.name == name }
            raise Disallow::Error
          end
        end
      end
    end
  end
  ActiveRecord::Base.include Disallow::Model
end
