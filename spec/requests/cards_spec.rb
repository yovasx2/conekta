require 'rails_helper'

RSpec.describe 'Cards', type: :request do
  describe 'POST #create' do
    it 'returns http success' do
      post cards_path, params: {
        card_number: '1234123412341234',
        expiration_month: '01',
        expiration_year: '20',
        secure_code: '999'
      }
      expect(response).to have_http_status(:success)
    end

    it 'returns http unprocessable entity' do
      post cards_path, params: { }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end