class Charge < ApplicationRecord
  validates :amount, presence: true
  validates :card, presence: true, on: :update
  validates :amount, numericality: { greater_than: 0 }

  belongs_to :card

  def to_json(opts={})
    opts.merge!(:methods => :card_token, :only => [:amount])
    super(opts)
  end

  private

  def card_token
    self.card.card_token
  end
end
