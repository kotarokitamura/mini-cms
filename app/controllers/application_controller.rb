# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :set_layout
  before_filter :authenticate_user!, :set_iphone_format

  def set_layout
    iphone_reqest? ? "iphone" : "application"
  end

  def set_iphone_format
    request.format = iphone_request?
  end

  def after_sign_in_path_for(resource)
    organizations_edit_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  rescue_from Exception, :with => :handle_exceptions unless Rails.application.config.consider_all_requests_local

  private
  def iphone_request?
    request.user_agent =~ /(Mobile.+Safari)/
  end

  def handle_exceptions(e)
    case e
    when InvalidUrlError, ActiveRecord::RecordNotFound, ActionController::RoutingError, ActionController::UnknownAction
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
      logger.info("Rendering 404 with exception: #{e.message}")
    else
      render :file => "#{Rails.root}/public/500.html", :status => 500, :layout => false
      logger.info("Rendering 505 with exception: #{e.message}")
    end
  end
end

class InvalidUrlError < ::ActionController::ActionControllerError; end
