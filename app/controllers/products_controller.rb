class ProductsController < ApplicationController
    #show all products
    def index
        products = Product.all
        render json: products, status: :ok
    end

    #show a specific product
    def show
        product = Product.find_by(params[:id])
        render json: product, status: :ok

    end
    #create a new product
    def create
        product = Product.create(product_params)
        render json: product, status: :created

    end

    #update details of an existing product
    def update
        product = Product.find(params[:id])
        if product
            product.update(product_params)
            render json: product, status: :ok
        else
            render json: {error:'Unable to find that product'}, status: 400
        end

    end

    #delete a product
    def destroy
        product = Product.find_by(params[:id])
        product.destroy
        head :no_content
    end

    private
    def product_params
        params.permit(:name,:description,:image,:price)
    end





end
