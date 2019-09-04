class ApplicationController < ActionController::Base
  layout :layout_by_resource #layout da pagina
  before_action :check_pagination
  before_action :set_global_params

  protected

    def layout_by_resource
      devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"
      # verifica se o controler esta sendo acesado no devise
      # nome da classe que esta sendo acessada
    end

    def check_pagination
      unless user_signed_in? or admin_signed_in?
        params.extract!(:page)
      end
    end

    def set_global_params
      $global_params = params
    end
end
