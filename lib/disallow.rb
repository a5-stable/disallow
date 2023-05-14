require "disallow/exceptions"
require "disallow/version"
require "disallow/scopes"
require "active_record"

module Disallow
  module Model
    include Disallow::Scopes

    def self.included(base)
      base.extend ClassMethods
    end
  end

  ActiveRecord::Base.include Disallow::Model
end
