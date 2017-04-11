require 'rails_helper'

RSpec.describe 'Charges', type: :request do
  describe 'POST #create' do
    it 'returns http success' do
      card = FactoryGirl.create :card
      post charges_path, params: { amount: '123.23', card_token: card.card_token }
      expect(response).to have_http_status(:success)
    end

    it 'returns http unprocessable entity because card_token is already charged' do
      charge = FactoryGirl.create :charge
      post charges_path, params: { amount: '123.23', card_token: charge.card.card_token }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns http unprocessable entity because card_token is not found' do
      post charges_path, params: { amount: '123.23', card_token: 'not_found' }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns http unprocessable entity because card_token is expired' do
      charge = FactoryGirl.create :charge
      charge.card.updated_at = 10.minutes.ago
      charge.card.save
      post charges_path, params: { amount: '123.23', card_token: charge.card.card_token }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns http unprocessable entity' do
      post accounts_path, params: { name: '' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end