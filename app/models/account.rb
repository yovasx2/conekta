class Account < ApplicationRecord
  validates :name, presence: true
  validates :name, :public_key, :private_key, length: { maximum: 255 }

  after_validation :generate_keys

  def generate_keys
    begin
      self.salt        = Time.now.to_i
      keys             = Digest::SHA256.hexdigest("#{self.name}#{salt}#")
      self.public_key  = keys[0...keys.size/2]
      self.private_key = keys[keys.size/2..-1]
    end while(!is_unique?(:public_key, self.public_key) || !is_unique?(:private_key, self.private_key))
  end

  def to_json(opts={})
    opts.merge!(:only => [:public_key, :private_key])
    super(opts)
  end

  private

  def is_unique?(key, public_key)
    Account.where(key => public_key).empty?
  end
end
