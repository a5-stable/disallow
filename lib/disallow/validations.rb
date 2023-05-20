require 'disallow/exceptions'

module Disallow
  module Validations
    def disallow_validations!
      if __validations.any?
        raise Disallow::ValidationError.new(name)
      end

      @disallow_validations = true
    end

    def validates(*attr)
      if @disallow_validations
        raise Disallow::ValidationError.new(name)
      end

      super(*attr)
    end
  end
end
