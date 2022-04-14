class Vendo::Base
  include HTTParty
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

  end
end