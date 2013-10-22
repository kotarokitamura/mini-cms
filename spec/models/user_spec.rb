# coding: utf-8
require 'spec_helper'

describe User do

  fixtures :organizations, :users, :members
  before do
    @user = User.new(:email => 'hoge@example.com', :password => 'password', :password_confirmation => 'password')
  end

  context 'with admin user and not admin user' do
    USER_ID_ADMIN_USER = 1
    USER_ID_NOT_ADMIN_USER = 3
    it "should be return true when Access admin user" do
      current_user = User.find(USER_ID_ADMIN_USER)
      User.admin_user?(current_user).should be_true
    end

    it "should be false true when Access not admin user" do
      current_user = User.find(USER_ID_NOT_ADMIN_USER)
      User.admin_user?(current_user).should be_false
    end
  end

  context 'with some situation in user' do
    it "should return false when insert unmatch password with password_confirmation" do
      @user.password = 'hoge'
      @user.save.should be_false
    end

    it "should return true when insert correct password_confirmation" do
      @user.password = 'password'
      @user.save.should be_true
    end

    it "should return true when insert correct password_confirmation" do
      @user.password = 'password'
      @user.save.should be_true
    end

    it "should return false when insert password under #{ResourceProperty.password_minimum_length}" do
      password = 'a' * (ResourceProperty.password_minimum_length - 1)
      @user.save.should be_true
    end

    it "should return false when insert password over #{ResourceProperty.password_maximum_length}" do
      password = 'a' * (ResourceProperty.password_maximum_length + 1)
      @user.password = @user.password_confirmation = password
      @user.save.should be_false
    end

    it "should return true when insert password correct lenght" do
      password = 'a' * ResourceProperty.password_maximum_length 
      @user.password = @user.password_confirmation = password
      @user.save.should be_true
    end

    it "should return true when insert password correct lenght in japanese" do
      password = 'あ' * ResourceProperty.password_maximum_length 
      @user.password = @user.password_confirmation = password
      @user.save.should be_true
    end

    it "should return true when insert correct email" do
      @user.save.should be_true
    end

    it "should return false when insert uncorrect email" do
      email = 'adsaf'
      @user.email = email
      @user.save.should be_false
    end

    it "should return false when insert ununique email" do
      email = 'hoge2@example.com'
      @user.email = email
      @user.save.should be_false
    end

    it "should return false when insert unique email" do
      email = 'hoge4@example.com'
      @user.email = email
      @user.save.should be_true
    end
  end
end
