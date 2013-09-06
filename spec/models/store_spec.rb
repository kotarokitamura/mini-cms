# coding: utf-8
require 'spec_helper'

describe Store do
  fixtures :stores
  before do 
    @store = Store.new
  end

  context 'with insert some data' do
    it 'should return true when insert under 50 charactors in store_name in Englis' do 
      store_name = 'a'*50
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_true
    end

    it 'should return true when insert over 50 charactors in store_name in Englis' do 
      store_name = 'a'*51
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_false
    end

    it 'should return true when insert under 50 charactors in store_name in Japanese' do 
      store_name = 'あ'*50
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_true
    end

    it 'should return true when insert over 50 charactors in store_name in Japanese' do 
      store_name = 'あ'*51
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_false
    end
  end
end
