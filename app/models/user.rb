class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable
	has_many :tasks, foreign_key: "creator_id", class_name: "Task"
	has_many :assigned_tasks, foreign_key: "assignee_id", class_name: "Task"
end
