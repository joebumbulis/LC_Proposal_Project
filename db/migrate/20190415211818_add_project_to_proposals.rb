class AddProjectToProposals < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposals, :project, foreign_key: true
  end
end
