# frozen_string_literal: true

##
# https://github.com/thoughtbot/high_voltage#override
#
class RulesController < ApplicationController
  include HighVoltage::StaticPage

  before_action :authenticate_user!
end
