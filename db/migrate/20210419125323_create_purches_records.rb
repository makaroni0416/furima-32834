class CreatePurchesRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purches_records do |t|
      t.references    :user,      null: false, foreign_key:true
      t.references    :display,   null: false, foreign_key:true
      t.timestamps
    end
  end
end
