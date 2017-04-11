class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :card_number
      t.string :expiration_month
      t.string :expiration_year
      t.string :secure_code
      t.string :card_token

      t.timestamps
    end
  end
end
