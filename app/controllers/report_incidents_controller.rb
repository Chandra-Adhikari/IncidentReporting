class ReportIncidentsController < ApplicationController

	def index
		@reports = ReportIncident.all
	end

	def new
		@report = ReportIncident.new
		@report_images = @report.images.build
	end

	def create
		@report = ReportIncident.new(report_params)
		if @report.save
			respond_to do |format|
          		format.html { redirect_to root_path, notice: 'Thank for reporting the incident.' }
    		end
		else
			respond_to do |format|
          		format.html { redirect_to root_path, notice: @report.errors.full_messages.first }
    		end
		end
	end

	private
	def report_params
		params.require(:report_incident).permit(:incident, images_attributes: [:id, :file, :imageable_id,:imageable_type,:_destroy])
	end
end
