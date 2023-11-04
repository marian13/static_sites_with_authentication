class ApplicationController < ActionController::Base
  ##
  # @internal
  #   - https://github.com/heartcombo/devise#controller-filters-and-helpers
  #
  before_action :authenticate_user!
end
