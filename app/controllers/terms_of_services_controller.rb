class TermsOfServicesController < ApplicationController
  skip_before_action :require_login

  def index; end
end
