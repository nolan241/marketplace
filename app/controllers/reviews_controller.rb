class ReviewsController <ApplicationController
    before_action :authenticate_user!
    before_action :set_review, only: [:edit, :update, :destroy]  

    def create
    @review = current_user.reviews.new(review_params)
    
    respond_to do |format|
      if @review.save
            format.html { redirect_to @review.place, notice: 'Review was successfully created.' }
          else
            format.html { render :new }
          end
        end
    end
    
    def edit
      @place = @review.place
    end
    
    def update
    respond_to do |format|
      if @review.update(review_params)
            format.html { redirect_to @review.place, notice: 'Review was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end
    
    def destroy
    @review.destroy
        respond_to do |format|
          format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
        end
    end
    
    private 
    
    def set_review
      @review = Review.find(params[:id])	
    end
    
    def review_params
      params.require(:review).permit(:content, :place_id, :score)
    end

end