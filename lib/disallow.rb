require "active_record"
require "disallow/exceptions"
require "disallow/scopes"
require "disallow/callbacks"
require "disallow/version"

module Disallow
  module Model
    include Disallow::Scopes
    include Disallow::Callbacks

    def self.included(base)
      base.extend ClassMethods
    end
  end

  ActiveRecord::Base.include Disallow::Model
end
