# coding: utf-8
require 'spec_helper'

describe OrganizationInfo do
  fixtures :organizations, :organization_infos
 
  before do
    @organization_info = OrganizationInfo.new
  end 
 
  context 'with insert some datas' do
    it 'should return true insert correct phone' do
      phone = '000-000-0000'
      @organization_info.attributes = {:organization_id => 1, :phone => phone}
      @organization_info.save.should be_true
    end

    it 'should return true insert blanck in phone' do
      phone = ''
      @organization_info.attributes = {:organization_id => 1, :phone => phone}
      @organization_info.save.should be_true
    end

    it 'should return false insert uncorrect charactors' do
      phone = 'aaa-aaaa-aaaa'
      @organization_info.attributes = {:organization_id => 1, :phone => phone}
      @organization_info.save.should be_false
    end

    it 'should return true insert correct product_information_flag ' do
      product_info_falg = 1 
      @organization_info.attributes = {:organization_id => 1, :phone => '000-000-0000', :product_information_flag => product_info_falg}
      @organization_info.save.should be_true
    end

    it 'should return true insert correct product_information_flag ' do
      product_info_falg = 0 
      @organization_info.attributes = {:organization_id => 1, :phone => '000-000-0000', :product_information_flag => product_info_falg}
      @organization_info.save.should be_true
    end

    it 'should return true insert other of 1 and 0 in product_information_flag' do
      product_info_falg = 2 
      @organization_info.attributes = {:organization_id => 1, :phone => '000-000-0000', :product_information_flag => product_info_falg}
      @organization_info.save.should be_false
    end

    it 'should return true insert correct store_information_flag ' do
      store_info_falg = 1 
      @organization_info.attributes = {:organization_id => 1, :phone => '000-000-0000', :store_information_flag => store_info_falg}
      @organization_info.save.should be_true
    end

    it 'should return true insert correct store_information_flag ' do
      store_info_falg = 0 
      @organization_info.attributes = {:organization_id => 1, :phone => '000-000-0000', :store_information_flag => store_info_falg}
      @organization_info.save.should be_true
    end

    it 'should return true insert other of 1 and 0 in store_information_flag' do
      store_info_falg = 2 
      @organization_info.attributes = {:organization_id => 1, :phone => '000-000-0000', :store_information_flag => store_info_falg}
      @organization_info.save.should be_false
    end
  end     
end
