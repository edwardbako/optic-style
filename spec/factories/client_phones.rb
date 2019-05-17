FactoryGirl.define do
  factory :client_phone, class: 'Client::Phone' do
    number "MyString"
    client nil
    comment "MyString"
  end
end
