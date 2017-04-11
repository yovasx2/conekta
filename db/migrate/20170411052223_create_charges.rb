class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.float      :amount
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
