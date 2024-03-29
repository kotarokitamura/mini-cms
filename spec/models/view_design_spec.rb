# coding: utf-8
require 'spec_helper'

describe ViewDesign do
  fixtures :organizations, :view_designs

  before do
    @view_design = ViewDesign.new
  end

  context 'with insert some datas' do
    it 'shoud return ture insert correct view design' do
      design_number = 1
      @view_design.attributes ={:organization_id => 1, :design_number => design_number}
      @view_design.save.should be_true
    end

    it 'shoud return false insert string view design' do
      design_number = 'a'
      @view_design.attributes ={:organization_id => 1, :design_number => design_number}
      @view_design.save.should be_false
    end

    it 'shoud return false insert japanes in  view design' do
      design_number = 'あ'
      @view_design.attributes ={:organization_id => 1, :design_number => design_number}
      @view_design.save.should be_false
    end

    it 'shoud return false insert uncorrect view design' do
      design_number = -1
      @view_design.attributes ={:organization_id => 1, :design_number => design_number}
      @view_design.save.should be_false
    end

    it 'shoud return false insert nil view design' do
      design_number = '' 
      @view_design.attributes ={:organization_id => 1, :design_number => design_number}
      @view_design.save.should be_false
    end
  end
end
