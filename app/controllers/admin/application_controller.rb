class Admin::ApplicationController < ApplicationController
  layout 'layouts/admin'
  before_action :http_basic_authenticate if Rails.env.production?

  private

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

end
