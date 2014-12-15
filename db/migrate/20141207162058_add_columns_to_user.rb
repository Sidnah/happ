class AddColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      # if you already have a email column, you have to comment the below line and add the :encrypted_password column manually (see devise/schema.rb).
      t.string :happername, null: false, default: ""
      t.string :full_name,  null: false, default: ""
      t.string :bio,  null: false, default: "Too lazy to change the bio !"
    end
  end
end