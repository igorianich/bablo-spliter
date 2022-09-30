class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :title
      t.integer :total
      t.datetime :date_time
      t.string :description
      t.references :expenseable, polymorphic: true

      t.timestamps
    end

    # add_index :expenses, [:expenseable]
  end
end
