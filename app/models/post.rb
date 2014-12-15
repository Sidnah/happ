class Post < ActiveRecord::Base

	belongs_to :user

	validates :text, length: { maximum: 140 }

	def self.search(query)
	    # where(:title, query) -> This would return an exact match of the query
	    where("text like ?", "%#{query}%") 
  end

end
