require 'rails_helper'

RSpec.describe 'Accounts', type: :request do
  describe 'POST #create' do
    it 'returns http success' do
      post accounts_path, params: { name: 'GI Joe' }
      expect(response).to have_http_status(:success)
    end

    it 'returns http unprocessable entity' do
      post accounts_path, params: { name: '' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end