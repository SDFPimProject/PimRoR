require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:test)
  end

  test "should not save user without data" do
    user = User.new
    assert_not user.save
  end

  test "should save user" do
    assert @user.save
  end



  test "should not validate first_name to short" do
    @user.first_name = "a"
    assert_not @user.valid?
  end 
  
  test "should not validate email first_name to long" do
    @user.first_name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    assert_not @user.valid?
  end 
  
  test "should validate first_name" do
    @user.first_name = "test"
    assert @user.valid?
  end



  test "should not validate last_name to short" do
    @user.last_name = "a"
    assert_not @user.valid?
  end 
  
  test "should not validate email last_name to long" do
    @user.last_name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    assert_not @user.valid?
  end 
  
  test "should validate last_name" do
    @user.last_name = "test"
    assert @user.valid?
  end



  test "should not validate email 1" do
    @user.email = "email"
    assert_not @user.valid?
  end

  test "should not validate email 2" do
    @user.email = "a@b.de"
    assert_not @user.valid?
  end

  test "should not validate email 3" do
    @user.email = "a@b.c"
    assert_not @user.valid?
  end

  test "should not validate email 4" do
    @user.email = "abcde.com"
    assert_not @user.valid?
  end

  test "should validate email" do
    @user.email = "mail@pim.com"
    assert @user.valid?
  end



  test "should not validate birthday 1" do
    @user.birthday = "dasdfasdf"
    assert_not @user.valid?
  end 

  test "should not validate birthday 2" do
    @user.birthday = "01.01.2199"
    assert_not @user.valid?
  end 

  test "should validate birthday 3" do
    @user.birthday = "01.01.2016"
    assert_not @user.valid?
  end 



  test "should not validate street_and_nr to short" do
    @user.state = "a 1"
    assert_not @user.valid?
  end 
  
  test "should not validate street_and_nr to long" do
    @user.state = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz 12"
    assert_not @user.valid?
  end 

  test "should not validate street_and_nr number missing" do
    @user.state = "test"
    assert_not @user.valid?
  end 

  test "should not validate street_and_nr street  missing" do
    @user.state = "12"
    assert_not @user.valid?
  end 
  
  test "should validate street_and_nr" do
    @user.state = "test 1"
    assert @user.valid?
  end


  
  test "should not validate state to short" do
    @user.state = "a"
    assert_not @user.valid?
  end 
  
  test "should not validate email state to long" do
    @user.state = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    assert_not @user.valid?
  end 
  
  test "should validate state" do
    @user.state = "test"
    assert @user.valid?
  end



  test "should not validate country_name to short" do
    @user.country_name = "a"
    assert_not @user.valid?
  end 
  
  test "should not validate email country_name to long" do
    @user.country_name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    assert_not @user.valid?
  end 
  
  test "should validate country_name" do
    @user.country_name = "test"
    assert @user.valid?
  end
  


  test "should not validate locality to short" do
    @user.locality = "a"
    assert_not @user.valid?
  end 
  
  test "should not validate email locality to long" do
    @user.locality = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
    assert_not @user.valid?
  end 
  
  test "should validate locality" do
    @user.locality = "test"
    assert @user.valid?
  end



  test "should not validate zip code to short" do
    @user.zip_code = 1
    assert_not @user.valid?
  end

  test "should not validate zip code to long" do
    @user.zip_code = 123456
    assert_not @user.valid?
  end

  test "should not validate zip code fromat" do
    @user.zip_code = "1ab45"
    assert_not @user.valid?
  end

  test "should validate new zip code" do
    @user.zip_code = "12345"
    assert @user.valid?
  end
end