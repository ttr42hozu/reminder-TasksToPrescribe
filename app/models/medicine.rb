class Medicine < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :usage

  belongs_to :patient
  has_one :preparation
end
