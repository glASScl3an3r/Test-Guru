# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Access denied to view this page.' unless current_user.is_a?(Admin)
  end
end
