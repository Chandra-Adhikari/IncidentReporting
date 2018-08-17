class Incident < ApplicationRecord
	has_many :incident_types
  	has_many :incident_details, through: :incident_types
end
