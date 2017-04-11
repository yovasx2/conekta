require "rails_helper"

RSpec.describe CardsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/tokenize").to route_to("cards#create")
    end
  end
end
