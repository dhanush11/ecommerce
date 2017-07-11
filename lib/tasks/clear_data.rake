task :clear_data => :environment do 
	Review.delete_all
end
