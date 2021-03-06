class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  before_action :configure_permitted_parameters_name, if: :devise_controller?

  protect_from_forgery with: :exception

  #before_filter :user_access_log


  def alipay_client
    client = Alipay::Client.new(
      url: ENV['ALIPAY_API'],
      app_id: ENV['APP_ID'],
      app_private_key: ENV['APP_PRIVATE_KEY'],
      alipay_public_key: ENV['ALIPAY_PUBLIC_KEY']
    )
  end

  def user_access_log
    session_id = session[:session_id] || ""
    user_id = (current_user && current_user.id) || ""
    user_name = (current_user && current_user.name) || ""
    STAT_LOGGER.info "[access]\t#{request.request_method}\t#{request.url}\t#{request.referer}\t#{request.remote_ip}\t#{request.user_agent}\t#{session_id}\t#{user_id}\t#{user_name}"
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end
  
  protected

    def self.permission
      return name = controller_name.classify.constantize rescue nil
    end

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end 
    def load_permissions
      current_user.roles.each do |role|
        @current_permissions = role.permissions.collect{|i| [i.subject_class, i.action]}
      end
    end

    def is_super_admin?
      redirect_to root_path and return unless current_user.super_admin?
    end

    def configure_permitted_parameters_name
      added_attrs = [:phone, :email, :password, :password_confirmation, :remember_me, :inviter]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def convert_to_md5(value)
      Digest::MD5.hexdigest(value) unless value.blank?
    end
end
