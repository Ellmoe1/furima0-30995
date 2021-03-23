class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string     :postal_code,   null: false ,default: "" 
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false ,default: "" 
      t.string     :address,       null: false ,default: "" 
      t.string     :building,      default: ""
      t.string     :phoneno,       null: false ,default: "" 
      t.references :purchase , foreign_key: true
      t.timestamps
    end
  end
end
