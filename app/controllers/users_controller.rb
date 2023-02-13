class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        user = User.create(user_params)
     if user.valid?
         render json: { user: UserSerializer.new(user) }, status: :created
     else
         render json: { error: 'failed to create user' }, status: :unprocessable_entity
     end
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted

    end

    private

    def user_params
      params.require(:user).permit(:username, :password, :email, :password_confirmation)
    end
end