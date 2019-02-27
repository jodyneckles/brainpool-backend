class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :find_user, only: [:show, :edit, :update]

    def index
      @users = User.all
      render json: @users
    end

    def show
      render json: @user, status: 200
    end

    def profile
      render json: { user: UserSerializer.new(get_current_user) }, status: :accepted
    end

    def create
      @user = User.new(user_params)
      if @user.valid? && @user.save
        @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), token: @token }, status: :created
      else
        render json: {error: "Unable to create user."}, status: :not_acceptable
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        render json: {error: "Your details have been updated."}, status: :created
      else
        render json: {error: "Unable to update your details."}, status: :not_acceptable
      end
    end

    def signin
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        render json: {user: @user.username, id: @user.id}
      else
        render json: {error: 'Username/password invalid.'}, status: 400
      end
    end

    def validate
      @user = get_current_user
      if @user
        render json: {username: @user.username, token: encode_token({id: @user.id})}
      else
        render json: {error: 'Username/password invalid.'}, status: 401
      end
    end

    def get_content
      @user = get_current_user
      if @user
        render json: @user.workspaces
      else
        render json: {error: 'Not a valid user.'}, status: 401
      end
    end


    private

    def user_params
      params.require(:user).permit(:username, :password, :firstname, :lastname, :email, :avatar)
    end

    def find_user
      @user = User.find(params[:id])
    end
end


      # def destroy
      #   @user.destroy
      #   redirect_to users_path
      # end

      # def stories
      # @user = User.find(params[:id])
      #   render json: @user.stories
      #end



# // client code
# fetch(`http://mypage.com/users/edit-name`, {
#     method: 'PATCH',
#     headers: {
#         'Content-Type': 'application/json',
#         'Authorization': localStorage.getItem('token')
#     },
# 	body: JSON.stringify({ name: "New name" })
# })


# // rails route:
# patch '/users/edit-name', to: 'users#edit_name'

# // rails users controller:
# def edit_name
# 	user = get_current_user
# 	if user
# 		user.name = params[:name]
# 		user.save
# 		render json: {message: 'User updated successfully!'}
# 	else
# 		render json: {error: 'User not found'}, status: 404
# 	end
# end
