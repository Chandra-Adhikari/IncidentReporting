class CreateInvolvedPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :involved_people do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :incident_detail, foreign_key: true

      t.timestamps
    end
  end
end
