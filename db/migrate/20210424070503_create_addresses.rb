class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string       :postcode,                null: false, default: ""
      t.integer      :prefecture_id,           null: false
      t.string       :city,                    null: false, default: ""
      t.string       :block,                   null: false, default: ""
      t.string       :building,                             default: ""
      t.string       :phone_number,            null: false
      t.references   :purches_record,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
