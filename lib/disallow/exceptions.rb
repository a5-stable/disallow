module Disallow
  class Error < StandardError
  end

  class DefaultScopeError < Error
    def initialize(class_name)
      super("default_scope is not allowed on #{class_name}")
    end
  end

  class CallbackError < Error
    def initialize(class_name, callback_name)
      sbj = callback_name ? "#{callback_name} callback is " : "all callbacks are"
      super("#{sbj} not allowed on #{class_name}")
    end
  end
end
