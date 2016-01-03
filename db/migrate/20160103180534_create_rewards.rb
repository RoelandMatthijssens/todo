class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
