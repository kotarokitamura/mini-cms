# coding: utf-8
require 'spec_helper'

describe Store do
  fixtures :stores
  before do 
    @store = Store.new
  end

  context 'with insert some data' do
    it "should return true when insert under #{ResourceProperty.store_name_max_length} charactors in store_name in Englis" do 
      store_name = 'a' * ResourceProperty.product_name_max_length
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_true
    end

    it "should return true when insert over #{ResourceProperty.product_name_max_length} charactors in store_name in Englis" do 
      store_name = 'a' * ResourceProperty.product_name_max_length + 'a'
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_false
    end

    it "should return true when insert under #{ResourceProperty.product_name_max_length} charactors in store_name in Japanese" do 
      store_name = 'あ' * ResourceProperty.product_name_max_length
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_true
    end

    it "should return true when insert over #{ResourceProperty.product_name_max_length} charactors in store_name in Japanese" do 
      store_name = 'あ' * ResourceProperty.product_name_max_length + 'あ'
      @store.attributes = {:organization_id => 1, :store_name => store_name}
      @store.save.should be_false
    end
  end
end
