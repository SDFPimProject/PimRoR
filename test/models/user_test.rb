require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user without data" do
    user = User.new
    assert_not user.save
  end

  test "should save user" do
    user = users(:test)
    assert user.save
  end


  
end
