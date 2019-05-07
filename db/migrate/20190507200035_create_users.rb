class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password
      t.boolean :admin
      t.string :company_name
      t.text :note

      t.timestamps
    end
  end
end
