class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :tel
      t.string :email

      t.timestamps null: false
    end
  end
end
