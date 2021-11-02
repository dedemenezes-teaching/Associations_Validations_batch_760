class Doctor < ActiveRecord::Base
  # has_many => create an instance method
  has_many :interns

  has_many :consultations
  has_many :patients, through: :consultations

  validates :last_name, presence: true
  validates :last_name, length: { minimum: 3 }
  # the order is not important -> It's validating the both together using the SCOPE
  validates :first_name, uniqueness: { scope: :last_name }
end
