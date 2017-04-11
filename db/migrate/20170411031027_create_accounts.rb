class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string  :name
      t.integer :salt
      t.string  :public_key
      t.string  :private_key

      t.timestamps
    end
  end
end
