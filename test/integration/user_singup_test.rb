require 'test_helper'

class UserSingupTest < ActionDispatch::IntegrationTest
  test "invalid singup information" do  	
  	get signup_path
  	assert_no_difference 'User.count' do
  		post users_path, user: {name:"",
  								email:"mail@valid",
  								password:"foo",
  								password_confimation:"bar"}
  	end
  	assert_template 'users/new'
  end

  test "valid singup information" do
    get signup_path
    assert_difference 'User.count' do
      post_via_redirect users_path, user:{name:"Fill",
                            email:"valid@mail.com",
                            password:"foobar",
                            password_confimation:"foobar"}                             
    end
    assert_template 'users/show'
  end
end
