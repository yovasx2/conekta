require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_length_of(:public_key).is_at_most(255) }
    it { should validate_length_of(:private_key).is_at_most(255) }
  end

  it 'valid factory' do
    account = FactoryGirl.build(:account)
    expect(account).to be_valid
  end

  describe 'genarate_keys!' do
    before(:each) do
      @account = FactoryGirl.create(:account)
    end

    it 'should assign a salt' do
      @account.generate_keys!
      expect(@account.salt).not_to be(nil)
    end

    it 'should assign a public_key' do
      @account.generate_keys!
      expect(@account.public_key).not_to be(nil)
    end

    it 'should assign a private_key' do
      @account.generate_keys!
      expect(@account.private_key).not_to be(nil)
    end
  end

  describe 'is_unique(public_key)' do
    before(:each) do
      @account = FactoryGirl.create(:account)
    end

    it 'should return false' do
      result = @account.send(:is_unique?, :public_key, @account.public_key)
      expect(result).to eq(false)
    end

    it 'should return false' do
      result = @account.send(:is_unique?, :private_key, @account.private_key)
      expect(result).to eq(false)
    end
  end
end