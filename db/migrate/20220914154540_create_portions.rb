class CreatePortions < ActiveRecord::Migration[6.1]
  def change
    create_table :portions do |t|

      t.timestamps
    end
  end
end
