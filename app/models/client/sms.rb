class Client::Sms < ApplicationRecord
  class Error < StandardError; end

  belongs_to :phone, class_name: 'Client::Phone', foreign_key: 'client_phone_id'

  validates_presence_of :text
  validate :smsable_phone

  after_create :send_off

  def smsable_phone
    unless phone.smsable?
      errors.add(:phone_format, "Невозможно отправить СМС на этот номер #{phone.number}.")
    end
  end

  def send_off
    number = phone.digitized_number

    response = SmsSender.send(to: number, text: text)

    data = response['sms'][number]
    update({
               status: data['status_code'],
               sms_id: data['sms_id'],
               status_text: data.fetch('status_text', "Сообщение принято в обработку.")
           })
  end

  def reload_status
    response = SmsSender.status [sms_id]
    data = response['sms'][sms_id]
    update({
               status: data['status_code'],
               status_text: data['status_text']
           })
  end
end
