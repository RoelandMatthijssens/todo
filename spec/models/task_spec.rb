require "rails_helper"

RSpec.describe Task do
	before(:each) do
		@task = Task.create
	end
	describe "finished?" do
		it "should default to false" do
			expect(@task.finished?).to be false
		end
		it "should be false if finished_on is not set" do
			@task.finished_on = nil
			expect(@task.finished?).to be false
		end
		it "should be false if the finished_on time is in the future" do
			@task.finished_on = 10.minutes.from_now
			expect(@task.finished?).to be false
		end
		it "should be true if the finished_on time is set in the past" do
			@task.finished_on = 10.minutes.ago
			expect(@task.finished?).to be true
		end
	end
end
