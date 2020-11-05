class CreateGroupEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :group_events do |t|
      t.string :name
      t.string :description
      t.integer :status, default: 0
      t.datetime :start_date
      t.integer :duration
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
