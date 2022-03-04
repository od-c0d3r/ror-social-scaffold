class Api::V::AuthenticationController <ApiController
    skip_before_action :authenticate_user!

    def create
        user = User.find_by(email: params[:email])
        if user.valid_password? params[:password]
            render json: {
                JsonWebToken.encode(sub: user.id)
            }
        else
            render json: {
                error: "Invalid email or password"
            }
        end
    end
end