class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	include SessionsHelper

	def hello
		render text: "hello world !!!"
	end
	
	#事前过滤器
    #确保用户已登录
    def logged_in_user
    	unless logged_in?
        	store_location
        	flash[:danger] = "Please log in."
        	redirect_to login_url
        end
    end
    
    #确保是正确的用户
    def correct_user
    	@user = User.find(params[:id])
    	redirect_to(root_url) unless current_user?(@user)
    end
    
    #确保是管理员
    def admin_user
    	redirect_to(root_url) unless current_user.admin?
    end
    
end
