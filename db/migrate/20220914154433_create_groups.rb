class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_type
      t.belongs_to :owner

      t.timestamps
    end
  end
end
