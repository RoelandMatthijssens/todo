class CreateTasks < ActiveRecord::Migration
	def change
		create_table :tasks do |t|
			t.string :name
			t.string :description
			t.datetime :finished_on
			t.integer :value
			t.integer :creator_id
			t.integer :assignee_id

			t.timestamps
		end
	end
end
