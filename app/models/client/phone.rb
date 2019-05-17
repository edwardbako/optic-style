class Client::Phone < ApplicationRecord
  belongs_to :client

  validates_format_of :number, with: /\A\+\d \(\d\d\d\) \d\d\d\-\d\d\-\d\d\z/,
                      message: 'должен иметь вид +7 (XXX) XXX-XX-XX',
                      allow_blank: true

end
