namespace :ci do
	task :build => :environment do |task, args|
#		Rake::Task["db:test:prepare"].invoke
		Rake::Task["ci:setup:rspec"].invoke
		Rake::Task["spec"].invoke
	end
end
