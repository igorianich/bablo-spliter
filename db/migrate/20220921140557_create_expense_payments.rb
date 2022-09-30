class CreateExpensePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_payments do |t|
      t.belongs_to :user
      t.belongs_to :expense

      t.timestamps
    end
  end
end
