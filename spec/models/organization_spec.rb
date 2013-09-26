# coding: utf-8
require 'spec_helper'

describe Organization do
  fixtures :organizations
  
  before do 
    @organization = Organization.new
  end

  context 'with insert some datas' do
    it 'shoule return ture insert correct organization_name in English' do 
      name = 'social groupware' 
      @organization.attributes = {:organization_name => name, :organization_code => 'hogehoge'}
      @organization.save.should be_true
    end

    it 'shoule return ture insert correct organization_name in Japanese' do 
      name = '株式会社ソーシャルグループウェア'
      @organization.attributes = {:organization_name => name, :organization_code => 'hogehoge'}
      @organization.save.should be_true
    end

    it "shoule return false insert over #{ResourceProperty.organization_name_max_length} charactors  organization_name in Japanese" do 
      name = 'あ' * ResourceProperty.organization_name_max_length + 'あ'
      @organization.attributes = {:organization_name => name, :organization_code => 'hogehoge'}
      @organization.save.should be_false
    end

    it "shoule return false insert over #{ResourceProperty.organization_code_max_length} charactors  organization_name in english" do 
      name = 'a' * ResourceProperty.organization_name_max_length + 'a'
      @organization.attributes = {:organization_name => name, :organization_code => 'hogehoge'}
      @organization.save.should be_false
    end

    it 'shoule return false insert blank' do 
      name = ''
      @organization.attributes = {:organization_name => name, :organization_code => 'hogehoge'}
      @organization.save.should be_false
    end
    
    it 'should retrun true insert correct organization_code' do 
      organization_code = 'hogehoge123'
      @organization.attributes = {:organization_name => 'organization_name', :organization_code => organization_code }
      @organization.save.should be_true
    end

    it 'should retrun false insert blank to organization_code' do 
      organization_code = ''
      @organization.attributes = {:organization_name => 'organization_name', :organization_code => organization_code }
      @organization.save.should be_false
    end

    it "should retrun false insert over #{ResourceProperty.organization_code_max_length} charactor to organization_code in English" do 
      organization_code = 'a' * ResourceProperty.organization_code_max_length + 'a'
      @organization.attributes = {:organization_name => 'organization_name', :organization_code => organization_code }
      @organization.save.should be_false
    end

    it 'should retrun false insert organization_code in Japanese' do 
      organization_code = 'あああ'
      @organization.attributes = {:organization_name => 'organization_name', :organization_code => organization_code }
      @organization.save.should be_false
    end

    it "should retrun false insert organization_code with '_'" do 
      organization_code = 'hoge_hoge'
      @organization.attributes = {:organization_name => 'organization_name', :organization_code => organization_code }
      @organization.save.should be_false
    end

    it "should retrun false insert organization_code with '.'" do 
      organization_code = 'hoge.hoge'
      @organization.attributes = {:organization_name => 'organization_name', :organization_code => organization_code }
      @organization.save.should be_false
    end

    it 'should retrun false insert organization_code with big charactor'  do 
      organization_code = 'A'
      @organization.attributes = {:organization_name => 'organization_name', :organization_code => organization_code }
      @organization.save.should be_false
    end
  end
end
