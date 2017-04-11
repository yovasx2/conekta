FactoryGirl.define do
  factory :card do
    card_number      { 16.times.map{rand(10)}.join }
    expiration_month { '%02d' % (1+rand(12)) }
    expiration_year  { '%02d' % rand(100) }
    secure_code      { 16.times.map{rand(10)}.join }
  end
end
