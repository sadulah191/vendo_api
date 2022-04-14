class Vendo::Coupon

  attr_accessor :client

  def initialize(client)
    @client = client
  end

  def apply_coupon(coupon:)
    options = {
      headers: client.cart_headers
    }
    options = options.merge({ body: { coupon_code: coupon } })
    response = client.patch('/api/v2/storefront/cart/apply_coupon_code', options)

    response
  end
end
