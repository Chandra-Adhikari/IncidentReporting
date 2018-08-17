class IncidentDetail < ApplicationRecord
	has_many :images, as: :imageable, dependent: :destroy
	has_many :incident_types, dependent: :destroy
  	has_many :incidents, through: :incident_types
  	has_many :involved_people, dependent: :destroy
  	has_many :incident_observers, dependent: :destroy

  	accepts_nested_attributes_for :images , :allow_destroy => true, :reject_if =>:all_blank
  	accepts_nested_attributes_for :involved_people , :allow_destroy => true, :reject_if =>:all_blank
  	accepts_nested_attributes_for :incident_observers , :allow_destroy => true, :reject_if =>:all_blank

end