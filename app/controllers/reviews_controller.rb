class ReviewsController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = @cocktail.reviews.build(review_params)
    if @review.save 
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end 
  end 


  private 

  def review_params
    params.require(:review).permit(:content, :rating)
  end 
end 