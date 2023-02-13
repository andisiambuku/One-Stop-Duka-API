class CartsController < ApplicationController
    before_action :set_cart, only: [:update, :show]

    def index
      @carts = Cart.all
      render json: @carts
    end
  
    def create
      cart = Cart.new(cart_params)
      if cart.save
        render json: cart, status: :created
      else
        render json: cart.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @cart.update(cart_params)
        render json: @cart
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
    end
  
    def show
      render json: @cart
    end
  
    private
  
    def set_cart
      @cart = Cart.find(params[:id])
    end
  
    def cart_params
      params.require(:cart).permit(:user_id, :status)
    end
  end