# frozen_string_literal: true

class HomeController < ApplicationController
  ##
  # Processes application root.
  # https://api.rubyonrails.org/v7.0.4/classes/ActionController/Redirecting.html#method-i-redirect_to
  #
  def index
    redirect_to "/code_notes"
  end
end
