class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :client_name
      t.string :project_name
      t.string :prepared_for
      t.string :prepared_by
      t.date :date_created
      t.text :project_goals
      t.text :project_implementation
      t.text :project_outline
      t.text :estimate
      t.date :proposed_start_date

      t.timestamps
    end
  end
end
