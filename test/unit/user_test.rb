require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new

  	user.profile_name= users(:tintus).profile_name
  	
  	users(:tintus)
  	assert !user.save
  	
  	assert !user.errors[:profile_name].empty?
  end

  test "a user profile name should not have spaces" do
  	user = User.new
  	user.profile_name= "emma watson lalala"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Profile name must not have spaces")
  end

end
