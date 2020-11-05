class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :location
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.references :group_event, foreign_key: true
      
      t.timestamps
    end
  end
end
