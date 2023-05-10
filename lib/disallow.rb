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
        if __callbacks[:validate].present?
          raise Disallow::Error
        end
      end

      def disallow_default_scopes!(options = {})
        if default_scopes.present?
          raise Disallow::Error
        end
      end
    end
  end
  ActiveRecord::Base.include Disallow::Model
end
