require 'rails_helper'

RSpec.describe Card, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:card_number) }
    it { should validate_presence_of(:expiration_month) }
    it { should validate_presence_of(:expiration_year) }
    it { should validate_presence_of(:secure_code) }
    it { should validate_length_of(:card_number).is_at_most(16) }
    it { should validate_length_of(:expiration_month).is_at_most(2) }
    it { should validate_length_of(:expiration_year).is_at_most(2) }
  end

  it 'valid factory' do
    card = FactoryGirl.build(:card)
    expect(card).to be_valid
  end

  describe 'tokenize' do
    before(:each) do
      @card = FactoryGirl.create(:card)
      @card.tokenize
    end

    it 'should assign a secure_code' do
      expect(@card.secure_code).not_to be(nil)
    end

    it 'should assign a card_token' do
      expect(@card.card_token).not_to be(nil)
    end
  end

  describe 'to_json' do
    before(:each) do
      @card = FactoryGirl.create(:card)
    end

    it 'should contain card_token only' do
      body = JSON.parse(Card.last.to_json)
      expect(body.has_key?('card_token')).to be(true)
      expect(body.size).to eq(1)
    end
  end

  describe 'is_unique?(card_token)' do
    before(:each) do
      @card = FactoryGirl.create(:card)
      @card.tokenize
      @card.save
    end

    it 'should return false' do
      result = @card.send(:is_unique?, @card.card_token)
      expect(result).to eq(false)
    end

    it 'should return true' do
      result = @card.send(:is_unique?, 'unique_card_token')
      expect(result).to eq(true)
    end
  end
end