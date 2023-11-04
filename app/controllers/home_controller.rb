# frozen_string_literal: true

class HomeController < ApplicationController
  ##
  # @internal
  #   NOTE: Processes application root.
  #   - https://api.rubyonrails.org/v7.0.4/classes/ActionController/Redirecting.html#method-i-redirect_to
  #
  #   TAGS: static_sites
  #
  def index
    redirect_to "/#{STATIC_SITES.first}"
  end
end
