class Review < ActiveRecord::Base
  attr_accessible :description, :rating, :summary
 
  #after_create :increment_reviews_count

  # def increment_reviews_count
  # 	#product.reviews_count += 1
  # 	#product.save
  # 	product.increment! :reviews_count # equivalentes; importante el (!) para que gaurde en bd
  # end

  belongs_to :product, :counter_cache => true
  #belongs_to :product, :counter_cache => :reviews_count

  def description_bonita
  	"#{description} #{product.name}"
  end


  belongs_to :user
end
