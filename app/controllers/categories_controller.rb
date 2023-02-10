class CategoriesController < ApplicationController
    
        #show all categories
        def index
            categories = Category.all
            render json: categories, status: :ok
        end
    
        #show a specific category
        def show
            category = Category.find_by(params[:id])
            render json: category, status: :ok
    
        end
        #create a new category
        def create
            category = Category.create(category_params)
            render json: category, status: :created
    
        end
    
        #update details of an existing category
        def update
            category = Category.find(params[:id])
            if category
                category.update(category_params)
                render json: category, status: :ok
            else
                render json: {error:'Unable to find that category'}, status: 400
            end
    
        end
    
        #delete a category
        def destroy
            category = Category.find_by(params[:id])
            category.destroy
            head :no_content
        end
    
        private
        def category_params
            params.permit(:name,:description)
        end
    
    
end
