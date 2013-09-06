# coding: utf-8
require 'spec_helper'
  
describe Product do
  fixtures :products

  before do 
    @product = Product.new
  end

  context 'with insert some data' do 
    it 'should return true when insert under 50 charactors in product_name in English' do
      product_name = 'a'*50
      @product.attributes = {:organization_id => 1, :product_name => product_name} 
      @product.save.should be_true
    end
 
    it 'should return false when insert over 50 charactors in product_name in English' do
      product_name = 'a'*51
      @product.attributes = {:organization_id => 1, :product_name => product_name} 
      @product.save.should be_false
    end

    it 'should return false when insert over 50 charactors in product_name in Japanese' do
      product_name = 'あ'*51
      @product.attributes = {:organization_id => 1, :product_name => product_name} 
      @product.save.should be_false
    end

    it 'should return true when insert under 50 charactors in product_name in Japanese' do
      product_name = 'あ'*50
      @product.attributes = {:organization_id => 1, :product_name => product_name} 
      @product.save.should be_true
    end
  end
end
