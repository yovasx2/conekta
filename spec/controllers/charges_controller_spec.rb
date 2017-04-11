require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  let(:valid_attributes) {
    card = FactoryGirl.create :card
    { amount: 1223.23, card_token: card.card_token }
  }

  let(:invalid_attributes) {
    { amount: 1223.23, card_token: '' }
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Charge" do
        expect {
          post :create, params: valid_attributes, session: valid_session
        }.to change(Charge, :count).by(1)
      end

      it "assigns a newly created charge as @charge" do
        post :create, params: valid_attributes, session: valid_session
        expect(assigns(:charge)).to be_a(Charge)
        expect(assigns(:charge)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved charge as @charge" do
        post :create, params: invalid_attributes, session: valid_session
        expect(assigns(:charge)).to be_a_new(Charge)
      end
    end
  end
end
