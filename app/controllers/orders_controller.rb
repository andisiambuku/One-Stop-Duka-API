class OrdersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :order_not_found_method
    rescue_from ActiveRecord::RecordInvalid, with: :rescue_invalid_record

    # GET /orders
    def index
        orders = Order.all
        render json: orders
    end
    
     # GET /order/:id
     def show
        order = create_order
        render json: order
    end
    
     # POST /order
     def create
        order = Order.create!(order_params)
        render json: order, status: :created
    end

    # PATCH /order/:id
    def update
        order= create_order
        order.update!(order_params)
        render json: order, status: :created
    end
    
    # DELETE /order/:id
    def destroy
        order = create_order
        order.destroy
        head :no_content
    end
    
    private

    def order_params
        params.permit(:total_amount, :status, :date)
    end

    def order_not_found_method(not_found)
        render json: {error: not_found.record.errors.full_messages }, status: :not_found
    end

    def rescue_invalid_record(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def create_order
        Order.find(params[:id])
    end
end
