class IncidentType < ApplicationRecord
  belongs_to :incident
  belongs_to :incident_detail
end
