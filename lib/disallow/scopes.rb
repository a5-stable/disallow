
require 'disallow/exceptions'

module Disallow
  module Scopes
    module ClassMethods
      def disallow_default_scope!(options = {})
        if default_scopes.present?
          raise Disallow::Scopes::DefaultScopesError
        end

        @disallow_default_scope = true
      end

      def default_scope(*args)
        if @disallow_default_scope
          raise Disallow::Scopes::DefaultScopesError
        end

        super(*args)
      end
    end
  end
end
