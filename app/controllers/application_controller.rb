# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    organizations_edit_path
  end

  rescue_from Exception, :with => :handle_exceptions unless Rails.application.config.consider_all_requests_local

  private
  def handle_exceptions(e)
    case e
    when InvalidUrlError, ActiveRecord::RecordNotFound
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    else
      #TODO 処理
    end
  end
end

class InvalidUrlError < ::ActionController::ActionControllerError; end
