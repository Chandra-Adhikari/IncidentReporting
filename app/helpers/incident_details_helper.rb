module IncidentDetailsHelper
	
	def incident_types
		Incident.all.map{ |p| [p.title,p.id]}
	end

	def options_for_select_school
		School.all.select{ |p| [p.name,p.id]}
	end
end
