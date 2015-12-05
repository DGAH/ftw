require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = users(:jry)
	end

	test "unsuccessful edit" do
		log_in_as(@user)
		get edit_user_path(@user)
		patch user_path(@user), user: { name: '',
																	 email: '522344221@qq.com',
																	 password:              '123456',
																	 password_confirmation: '123456'}
	assert_template 'users/edit'
	end
	
	test "uscessful edit" do
		log_in_as(@user)
		get edit_user_path(@user)
		name = "foo"
		email = "foo@bar.com"
		patch user_path(@user), user: { name: name,
																		email: email,
																		password: "",
																		password_confirmation: ""}
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal @user.name, name
		assert_equal @user.email, email
	end

	test "successful edit with friend forwarding " do
		get edit_user_path(@user)
		log_in_as(@user)
		assert_redirected_to edit_user_path(@user)
		name = "Foo Bar"
		email = "foo@bar.com"
		patch user_path(@user), user: { name: name,
																		email: email,
																		password: "foobar",
																		password_confirmation: "foobar" }
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal @user.name, name
		assert_equal @user.email, email
	end
end
