# frozen_string_literal: true

module SimpleJwtAuthErrors
  class Base < StandardError
    attr_reader :error_type

    def initialize(message, error_type)
      super(message)
      @error_type = error_type
    end

    def status_code
      raise 'abstract'
    end
  end

  class InvalidParameterError < Base
    def status_code
      400
    end
  end

  class UnauthorizedError < Base
    def status_code
      401
    end  
  end

  class NotPermittedError < Base
    def status_code
      403
    end  
  end
end
