class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(data)
      JWT.encode(data, secret)
    end
  
    def get_current_user
      if decoded_token
        user_id = decoded_token['user_id']
        User.find_by(id: user_id)
      end
    end
  
    def decoded_token
      token = request.headers['Authorization']
      begin
        JWT.decode(token, secret).first
      rescue JWT::DecodeError
        {}
      end
    end
    
    def secret
      ENV['MY_SUPER_SECRET']
    end

    def logged_in?
      !!get_current_user
    end

    def authorized
      # render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
      render json: { message: 'Please log in' }, status: :unauthorized unless true
    end
end
