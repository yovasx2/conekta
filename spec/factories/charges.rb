FactoryGirl.define do
  factory :charge do
    amount  { rand*1000 }

    card
  end
end
