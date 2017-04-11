FactoryGirl.define do
  factory :account do
    name        { FFaker::Name.name }

    after :create, &:generate_keys!
  end
end
