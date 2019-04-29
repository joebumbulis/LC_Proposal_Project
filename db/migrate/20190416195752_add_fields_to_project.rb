class AddFieldsToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :client_name, :string
  end
end
