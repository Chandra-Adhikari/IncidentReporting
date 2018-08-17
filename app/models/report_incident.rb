class ReportIncident < ApplicationRecord
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images , :allow_destroy => true, :reject_if =>:all_blank
end