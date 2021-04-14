class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.integer :price
      t.belongs_to :reader
      t.belongs_to :magazine
      t.timestamps
    end
    
  end
end
