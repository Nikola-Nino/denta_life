# frozen_string_literal: true

module Dashboard
  class DashboardController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_user!

    def authorization_check
        unless current_user.admin?
            redirect_to root_path, notice: "You don't have authorization for this action!"
        end
    end
  end
end
