module Disallow
  class Error < StandardError
  end

  class DefaultScopeError < ::Disallow::Error
    def initialize(class_name)
      super("default_scope is not allowed on #{class_name}")
    end
  end
end
