class CreateDisplays < ActiveRecord::Migration[6.0]
  def change
    create_table :displays do |t|
      t.string     :product,           null: false, default: ""
      t.text       :product_text,      null: false
      t.integer    :category_id,       null: false
      t.integer    :product_status_id, null: false
      t.integer    :delivery_price_id, null: false
      t.integer    :prefecture_id,     null: false
      t.integer    :shipping_date_id,  null: false
      t.integer    :price,             null: false
      t.references :user,              null: false, foreign_key:true
      
      t.timestamps
    end
  end
end
