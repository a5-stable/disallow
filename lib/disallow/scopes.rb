require 'disallow/exceptions'

module Disallow
  module Scopes
    def disallow_default_scope!(options = {})
      if default_scopes.present?
        raise Disallow::DefaultScopeError.new(name)
      end

      @disallow_default_scope = true
    end

    def default_scope(*args)
      if @disallow_default_scope
        raise Disallow::DefaultScopeError.new(name)
      end

      super(*args)
    end
  end
end
