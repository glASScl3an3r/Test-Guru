class ApplicationController < ActionController::Base

  protected

  def not_implemented
    render plain: I18n.t(:not_implemented)
  end

end
