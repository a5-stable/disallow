module Disallow
  class Error < StandardError
  end

  module Scopes
    class DefaultScopesError < ::Disallow::Error
      def initialize
        super
      end
    end
  end
end
