class CreateTasks < ActiveRecord::Migration
	def change
		create_table :tasks do |t|
			t.string :name
			t.string :description
			t.date :finished_on
			t.integer :value

			t.timestamps
		end
	end
end
