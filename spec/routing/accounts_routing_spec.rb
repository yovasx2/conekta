require "rails_helper"

RSpec.describe AccountsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/accounts").to route_to("accounts#create")
    end
  end
end
