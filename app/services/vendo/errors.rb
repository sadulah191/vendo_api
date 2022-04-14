module Vendo
  module Errors
    class VendoError < StandardError
      attr_reader :code, :message

      def initialize(code = nil, message = nil)
        super()
        @code = code || 422
        @message = message || 'Something went wrong'
      end
    end

    class AuthenticationError < VendoError
      def initialize
        super(401, 'Authentication error')
      end
    end

    class NotFoundError < VendoError
      def initialize
        super(404, 'NotFound Error')
      end
    end

    class UnprocessableEntityError < VendoError
      def initialize
        super(422, 'UnprocessableEntity Error')
      end
    end

    class GatewayTimeout < VendoError
      def initialize
        super( 504, 'GatewayTimeout')
      end
    end

    CODES = {
      401 => Vendo::Errors::AuthenticationError,
      404 => Vendo::Errors::NotFoundError,
      422 => Vendo::Errors::UnprocessableEntityError,
      504 => Vendo::Errors::GatewayTimeout
    }.freeze
  end
end