class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references  :purchace,     foreign_key: true
      t.string      :postal_code,   null: false
      t.integer     :state_id,      null: false
      t.string      :city,          null: false
      t.string      :address_line,  null: false
      t.string      :building
      t.string      :telephone,     null: false
      t.timestamps
    end
  end
end
