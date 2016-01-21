require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(id: 0 ,name: "DGAH", email: "1346952149@qq.com", password: "000000")
    #@user = users(:michael)
    @recipe = Recipe.new(name: "my_favorite_dish", user_id: @user.id)
  end
  
  test "should be valid" do 
    assert @recipe.valid? 
  end
  
  test "user id should be present" do 
    @recipe.user_id = nil 
    assert_not @recipe.valid? 
  end
end
