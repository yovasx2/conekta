require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:valid_attributes) {
    { name: FFaker::Name.name }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Account" do
        expect {
          post :create, params: valid_attributes, session: valid_session
        }.to change(Account, :count).by(1)
      end

      it "assigns a newly created account as @account" do
        post :create, params: valid_attributes, session: valid_session
        expect(assigns(:account)).to be_a(Account)
        expect(assigns(:account)).to be_persisted
      end

      it 'returns http success' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:success)
      end

      it 'returns http unprocessable entity' do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end