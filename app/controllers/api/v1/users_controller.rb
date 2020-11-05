class Api::V1::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: { alert: @user.errors, status: :internal_server_error }
        end
    end
    
    def index
        render json: User.all
    end

    def restore_user
        if @user.soft_restore
            render json: @user
        else
            render status: :internal_server_error, json: {
            message: 'Could not restore user!',
            }
        end
    end 

    def show
        render json: @user
    end

    private
        def user_params
            params.require(:user).permit(:id, :name, :email, :password)
        end
end