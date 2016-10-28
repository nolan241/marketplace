class Place < ActiveRecord::Base
	validates_presence_of :name 
	validates_presence_of :phone 
	validates_presence_of :address 
	validates_presence_of :website 
	validates_presence_of :user_id

	belongs_to :user
	
    # need to tell geocoded from which field too 'decode', and to ensure the :geocoded address is validated	
    geocoded_by :address 
	after_validation :geocode 

	has_many :reviews, dependent: :destroy
	
	#method to calculate the average review of a place
	def average_rating
		self.reviews.sum(:score) / reviews.size 
		
		#add a rescue statement, to catch the ZeroDivissionError, and will set it to return 0
		rescue ZeroDivisionError
		0
	end
end
