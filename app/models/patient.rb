class Patient < ApplicationRecord
  belongs_to :user
  has_many :medicines
  has_one_attatched :image
end
