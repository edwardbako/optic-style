class Client::Phone < ApplicationRecord

  belongs_to :client
  has_many :smss, class_name: 'Client::Sms', foreign_key: 'client_phone_id'

  validates_format_of :number, with: /\A\+\d \(\d\d\d\) \d\d\d\-\d\d\-\d\d\z/,
                      message: 'должен иметь вид +7 (XXX) XXX-XX-XX',
                      allow_blank: true

  def smsable?
    if digitized_number[1].to_i == 9
      true
    else
      false
    end
  end

  def digitized_number
    number.tr('^0-9', '')
  end

end
