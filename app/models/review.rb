class Review < ActiveRecord::Base
  attr_accessible :description, :rating, :summary
 
  after_create :increment_count_reviews

  def increment_count_reviews
  	self.count_reviews += 1
  end

  belongs_to :product
  belongs_to :user
end
