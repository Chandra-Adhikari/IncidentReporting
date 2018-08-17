class CreateIncidentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :incident_types do |t|
      t.references :incident, foreign_key: true
      t.references :incident_detail, foreign_key: true

      t.timestamps
    end
  end
end
