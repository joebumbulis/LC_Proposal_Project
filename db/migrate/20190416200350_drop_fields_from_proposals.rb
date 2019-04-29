class DropFieldsFromProposals < ActiveRecord::Migration[5.2]
  def change
    remove_column :proposals, :client_name
    remove_column :proposals, :project_name
  end
end
