require "spec_helper"
require "rails_helper"

describe Vendo::Client do
  include Stubs

  before do
    coupon_stub
  end

  context "#coupon code" do
    let(:client) { Vendo::Client.new }

    it "adds coupon code to a line item" do
      response = client.apply_coupon_code("DISCOUNT10")
      coupon = JSON.parse(response)
      expect(response.code).to eq(200)
      expect(coupon["data"]["id"]).to eq("11")
    end
  end
end
