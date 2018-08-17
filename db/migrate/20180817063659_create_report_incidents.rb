class CreateReportIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :report_incidents do |t|
      t.text :incident

      t.timestamps
    end
  end
end
