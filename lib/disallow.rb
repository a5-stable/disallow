require "active_record"
require "disallow/exceptions"
require "disallow/scopes"
require "disallow/callbacks"
require "disallow/version"

module Disallow
  module Model
    module ClassMethods
      include Disallow::Callbacks
      include Disallow::Scopes
    end

    def self.included(base)
      base.extend ClassMethods
    end
  end

  ActiveRecord::Base.include Disallow::Model
end
