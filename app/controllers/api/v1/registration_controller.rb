class Api::V1::RegistrationController < ApiController
    skip_before_action :authenticate_user!
    def create
        @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

        if @user.save
            render json: { success: ['User created'] }
        else
            render json: { errors: @user.errors.full_messages }
        end
    end
end