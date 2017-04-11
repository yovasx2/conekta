require 'rails_helper'

RSpec.describe 'Cards', type: :request do
  describe 'POST #create' do
    it 'returns http success' do
      card = FactoryGirl.create :card
      post '/charges', params: {
        card_token: card.card_token,
        amount:     '01'
      }
      expect(response).to have_http_status(:success)
    end

    it 'returns http unprocessable entity' do
      post '/charges', params: { }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end