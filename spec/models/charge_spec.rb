require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:card).on(:update) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end

  it 'valid factory' do
    charge = FactoryGirl.build(:charge)
    expect(charge).to be_valid
  end

  describe 'to_json' do
    it 'should contain amount and card_token only' do
      body = JSON.parse(FactoryGirl.create(:charge).to_json)
      expect(body.has_key?('amount')).to be(true)
      expect(body.has_key?('card_token')).to be(true)
      expect(body.size).to eq(2)
    end
  end

  describe 'card_token' do
    it 'should return a valid value' do
      charge = FactoryGirl.create(:charge)
      result = charge.send(:card_token)
      expect(result).to eq(charge.card.card_token)
    end
  end
end