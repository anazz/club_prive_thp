# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: 'John', last_name: 'Dylan', email: 'john@example.com', password: 'passwords')
  end	


  test 'valid user' do 
    assert @user.valid?
  end

  test 'invalid without first_name' do
    @user.first_name = nil
    refute @user.valid?, 'user is valid without a name'
    assert_not_nil @user.errors[:first_name], 'no validation error for name present'
  end

  test 'invalid without last_name' do
    @user.last_name = nil
    refute @user.valid?, 'user is valid without a name'
    assert_not_nil @user.errors[:last_name], 'no validation error for name present'
  end

  test 'invalid without email' do
  	@user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid without password' do
    @user.password = nil
    refute @user.valid?
    assert_not_nil @user.errors[:password]
  end

  test 'invalid first_name with blanks' do
    @user.first_name = "     "
    refute @user.valid?, 'user is valid without a name'
    assert_not_nil @user.errors[:first_name], 'no validation error for name present'
  end

  test 'invalid last_name with blanks' do
    @user.last_name = "     "
    refute @user.valid?, 'user is valid without a name'
    assert_not_nil @user.errors[:last_name], 'no validation error for name present'
  end

  test 'invalid email with blanks' do
  	@user.email = "    "
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid password with blanks' do
    @user.password = "    "
    refute @user.valid?
    assert_not_nil @user.errors[:password]
  end

  test 'email already taken' do
    @user.email = User.exists?(:email => @user.email)
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end  

end