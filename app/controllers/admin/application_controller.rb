module Admin
  class ApplicationController < ::ApplicationController
    before_action :require_authentication
  end
end
