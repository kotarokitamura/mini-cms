# coding: utf-8
require 'spec_helper'

describe User do

  fixtures :organizations, :users
  before do
    @user = User.new(:organization_id => 1, :email => 'hoge@example.com', :password => 'password', :password_confirmation => 'password')
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
