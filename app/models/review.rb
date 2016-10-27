class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :place
    
    #every time a review is created there will be content and a score
	validates_presence_of :content
	validates_presence_of :score     
end
