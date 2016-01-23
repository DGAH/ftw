require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should redirect destroy for wrong recipe" do
    log_in_as(users(:jry)) 
    recipe = recipes(:gtv) 
    assert_no_difference 'Recipe.count' do 
      delete :destroy, id: recipe
    end 
    assert_redirected_to root_url 
  end
end
