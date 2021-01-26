class Medicine < ApplicationRecord
  belongs_to :patient
  has_one :preparation
end
