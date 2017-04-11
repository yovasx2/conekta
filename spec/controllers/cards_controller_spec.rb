require 'rails_helper'

RSpec.describe CardsController, type: :controller do

  let(:valid_attributes) {
    {
      card_number: '1234123412341234',
      expiration_month: '01',
      expiration_year: '20',
      secure_code: '999'
    }
  }

  let(:invalid_attributes) {
    {
      card_number: '',
      expiration_month: '13',
      expiration_year: '',
      secure_code: '9999'
    }
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, params: valid_attributes, session: valid_session
        }.to change(Card, :count).by(1)
      end

      it "assigns a newly created card as @card" do
        post :create, params: valid_attributes, session: valid_session
        expect(assigns(:card)).to be_a(Card)
        expect(assigns(:card)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved card as @card" do
        post :create, params: invalid_attributes, session: valid_session
        expect(assigns(:card)).to be_a_new(Card)
      end
    end
  end
end
