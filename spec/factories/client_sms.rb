FactoryGirl.define do
  factory :client_sm, class: 'Client::Sms' do
    client_phone nil
    text "MyText"
    status 1
    status_text "MyString"
    sms_id "MyString"
  end
end
