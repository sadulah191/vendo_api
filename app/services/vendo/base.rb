class Vendo::Base
  include HTTParty
  include Vendo::Errors

  base_uri 'https://demo.getvendo.com'


  def post(url , options={})
    error_or_response(self.class.post(url,options))
  end

  def get(url , options={})
    error_or_response(self.class.get(url,options))
  end

  def patch(url , options={})
    error_or_response(self.class.patch(url,options))
  end

  def delete(url , options={})
    error_or_response(self.class.delete(url,options))
  end

  def vendo_headers(order_token=nil)
    {
      "Accept": "application/vnd.api+json",
      "Content-Type": "application/vnd.api+json"
    }
  end

  def error_or_response(response)
    status = response.code
    respond_with_error(status, response) if status.between?(400, 599) || (response.respond_to?(:has_key?) && response.key?('error'))
    response
  end

  def respond_with_error(code, body)
    raise(Vendo::Errors::CODES[code].new) if Vendo::Errors::CODES.key? code

    raise Vendo::Errors::VendoError.new(code, body.message)
  end
end