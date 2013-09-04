# coding: utf-8
require 'spec_helper'

describe Homepage do
  fixtures :organizations  

  context 'with url have many pattern' do 
    it 'should return true when kitasang.com include only one ' do
      url = 'http://hoge.kitasang.com'
      Homepage.url_valid?(url).should be_true
    end

    it 'should return true when kitasang.com include plural ' do
      url = 'http://hoge.kitasang.com.kitasang.com'
      Homepage.url_valid?(url).should be_false
    end

    it 'should get correct organization_code' do
      url = 'http://sgw.kitasang.com'
      Homepage.get_organization_code(url).should == 'sgw'
    end
    
    it 'should get uncorrect organization_code' do
      url = 'http://sgw.kitasang.com'
      Homepage.get_organization_code(url).should_not == 'aaa'
    end
  end

  context 'with subdomain have many pattern' do 
    it 'should return true when subdomain have correct character' do
      subdomain = 'aaa'
      Homepage.subdomain_valid?(subdomain).should be_true
    end

    it 'should return true when subdomain have correct character' do
      subdomain = '111'
      Homepage.subdomain_valid?(subdomain).should be_true
    end

    it "should return false when subdomain have '.' character" do
      subdomain = 'aaa.aaa'
      Homepage.subdomain_valid?(subdomain).should be_false
    end

    it "should return false when subdomain have '_' character" do
      subdomain = 'aaa_aaa'
      Homepage.subdomain_valid?(subdomain).should be_false
    end
  
    it 'should return true when subdomain have japanese character' do
      subdomain = 'あああ'
      Homepage.subdomain_valid?(subdomain).should be_false
    end
   
    it 'should return correct organization_code from subdomain' do
      subdomain = organizations(:organization1).organization_code
      correct_id = organizations(:organization1).id
      Homepage.get_organization_id(subdomain).should == correct_id
    end
 
    it 'should return false select defferent organization_code from subdomain' do
      subdomain = organizations(:organization2).organization_code
      correct_id = organizations(:organization1).id
      Homepage.get_organization_id(subdomain).should_not == correct_id
    end
  end
end
