class Website::UserController < ApplicationController

	def index
		
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			UserMailer.welcome_email(user,url).deliver_now
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
	end

	def show
		
	end
	private

    def user_params
      params.require(:user).permit(:password_digest,:status, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :sign_in_count,  :privacy_policy, :is_subscribe, :remember_created_at, :role_id , :fullName, :email, :password, :password_confirmation, :profile_picture, :country, :community, :city, :mobile, :device_id, :terms_of_use, :confirmation_token,:authentication_token)
    end
end
