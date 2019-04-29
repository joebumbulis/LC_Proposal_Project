class AddSlugToProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :slug, :string
  end
end
