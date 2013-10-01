# coding: utf-8
require 'spec_helper'

describe User do
  fixtures :organizations, :users

  before do
    @user = User.new
  end

  context 'with some situation in user' do
    it 'should return true when insert firstname under 50 charactors' do
      @user.attributes = {:organization_id => 1, :mail => 'hoge@example.com', :password => 'password'}
      @user.first_name = 'a' * 50
      @user.save_should be_true 
    end
  end
end
