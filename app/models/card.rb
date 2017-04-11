class Card < ApplicationRecord
  validates :card_number, :expiration_month, :expiration_year, :secure_code, presence: true
  validates :card_number, length: { is: 16 }
  validates :expiration_month, :expiration_year, length: { maximum: 2 }
  # TODO add a validator for credit card number, but bank is missing in params

  has_one :charge

  after_validation :tokenize

  scope :not_expired, -> { where('updated_at > ?', 10.minutes.ago) }
  scope :tokenized, -> (card_token) { not_expired.where(card_token: card_token) }

  def is_charged?
    !self.charge.nil?
  end

  def tokenize
    return unless is_unique?(self.card_token) # not expired
    begin
      keys        = Digest::SHA256.hexdigest("#{secure_code}#{Time.now}")
      self.secure_code = keys[0...keys.size/2]
      self.card_token  = keys[keys.size/2..-1]
    end while(!is_unique?(self.card_token))
  end

  def to_json(opts={})
    opts.merge!(:only => [:card_token])
    super(opts)
  end

  private

  def is_unique?(card_token)
    Card.not_expired.where(card_token: card_token).empty?
  end
end
