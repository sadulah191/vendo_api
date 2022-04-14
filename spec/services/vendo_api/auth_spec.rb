require "spec_helper"
require 'rails_helper'

describe Vendo::Client do
  before do
    @client = Vendo::Client.new
  end

  context "#auhenticate" do
    it "authenticates a user" do
      auth = VCR.use_cassette("auth/bearer") { @client.authenticate }
      expect(auth).to eq(true)
    end
  end
end
