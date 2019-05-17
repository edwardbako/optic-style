class Client < ApplicationRecord

  include PgSearch

  pg_search_scope :search,
                  against: [:first_name, :last_name],
                  using: {
                      tsearch: {
                          prefix: true,
                          tsvector_column: 'tsv',
                      }
                  }

  belongs_to :branch
  has_many :orders, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  validates_presence_of :last_name
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true

  def full_name
    "#{last_name} #{first_name} #{patronymic}"
  end

  def last_name_initials
    "#{last_name} #{first_name.first}.#{patronymic.first}."
  end

  def age
    birth_date.present? ? ((Date.today - birth_date) / 365).floor : nil
  end
end
