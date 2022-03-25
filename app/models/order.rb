class Order < ApplicationRecord
	belongs_to :user
	belongs_to :book

  VALID_PHONE_REGEX = /\d[0-9]\)*\z/
  validates :telephone, presence: true, length: { minimum: 9, maximum: 11 },
            format: { with: VALID_PHONE_REGEX ,
            message: :invalid_phone }
  validates :address, presence: true
  validates :address, presence: true
end
