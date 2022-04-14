class Vendo::Cart
  attr_accessor :client

  def initialize(client)
    @client = client
  end

  def create
    response = client.post('api/v2/storefront/cart', {
      headers: client.cart_headers
    })
    client.vendo_cart = response["data"]["attributes"]["token"]
    response
  end

  def get(include_line_items = false)
    options = {
      headers: client.cart_headers
    }
    options = options.merge({query: { include: "line_items" }}) if include_line_items
    response = client.post('api/v2/storefront/cart', options)
    response
  end
end