class CategoriesController < ApplicationController
    def index
        @cateogries = Cateogry.all
    end

    def new
        @Category = Category.new
    end

    def create
        @category = Category.new(category_params)
    
          if @Category.save
           notice: "Category was successfully created." 
          else
            render :new
          end
      end

      private
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:cateogry).permit(:name, :priority)
    end
end
