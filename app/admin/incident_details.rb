ActiveAdmin.register IncidentDetail do
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
index :title =>"Incident Detail" do
    selectable_column
    # column :id
    column "Incident Types" do |incident|
      incident.incidents.map{|x| (x.title)}.join(', ')
    end
    column "Incident Date" do |incident|
      incident.incident_date.strftime("%B %d,%Y %I:%M %p")
    end
    column :location
    column :reporter_name	
    actions
  end

  show :title=> "Incident Details" do
    attributes_table do
      row :id
      row "Incident Types" do
      	incident_detail.incidents.map{|x| (x.title)}.join(', ')
      end
      row "Incident Date" do
        incident_detail.incident_date.strftime("%B %d,%Y %I:%M %p")
      end
      
      row :description
      row :reporter_name
      row :reporter_email
      row :reporter_phone
      row :role
      row "Involved People" do
      	incident_detail.involved_people.map{|x| (x.name)}.join(', ')
      end
      row "Incident Observer" do
      	incident_detail.incident_observers.map{|x| (x.name)}.join(', ')
      end
      div :class => "responsive" do
        table :class=>"image-pos" do
          thead do
            tr do
              th :colspan=>"10" do
                "Incident Images"
              end
            end
           end
          tbody do
            tr do
              incident_detail.images.each do |picture|

                td  do
                  image_tag(picture.file.url, :size => "150x150", :controls=> true,:fallback_image => "Your browser does not support HTML5 image tags")
                end
              end
            end
          end
        end
      end
      row :created_at do
        incident_detail.created_at.strftime("%B %d,%Y %I:%M %p")
      end
      row :updated_at do
        incident_detail.updated_at.strftime("%B %d,%Y %I:%M %p")
      end
    end
  end

end
