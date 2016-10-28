class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :place
    
    #every time a review is created there will be content and a score
	validates_presence_of :content
	validates_presence_of :score 
	
	#everytime that a review is saved. 
    after_save :calculate_average
    #calculate the average review for a place and save it to database 
	def calculate_average
	    #define a by calling the average_rating method in place.rb to get average review
		a = self.place.average_rating
		#update column :total_average in Places table
		self.place.update_attributes(total_average: a)
	end
	
end
