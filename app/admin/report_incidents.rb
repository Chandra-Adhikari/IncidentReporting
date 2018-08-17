ActiveAdmin.register ReportIncident do
	config.filters = false
	config.batch_actions = false
	actions :all, :except => [:new, :edit]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
 index :title =>"Report Incident" do
    selectable_column
    # column :id
    column :incident
    column "Report Date" do |incident|
      incident.created_at.strftime("%B %d,%Y %I:%M %p")
    end
    actions
  end

end
