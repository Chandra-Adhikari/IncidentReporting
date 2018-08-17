class IncidentDetailsController < ApplicationController
	def new		
		@incident = IncidentDetail.new
		@incident_images = @incident.images.build
		@involved_people = @incident.involved_people.build
		@incident_observers = @incident.incident_observers.build
	end

	def create
		@incident = IncidentDetail.create(incident_params)
		params[:incident_types].each do |x|
			@incident.incident_types.create(incident_id: x)
		end
		if @incident.save
			respond_to do |format|
          		format.html { redirect_to new_incident_detail_path, notice: 'Thank for reporting the incident.' }
    		end
		else
			respond_to do |format|
          		format.html { redirect_to new_incident_detail_path, notice: @incident.errors.full_messages.first }
    		end
		end
	end
	private
	def incident_params
		params.require(:incident_detail).permit(:description,:location,:incident_date,:reporter_name,:reporter_email,:reporter_phone, images_attributes: [:id, :file, :imageable_id,:imageable_type,:_destroy], involved_people_attributes: [:id, :name, :email,:phone,:_destroy], incident_observers_attributes: [:id, :name, :email,:phone,:_destroy])
	end
end
