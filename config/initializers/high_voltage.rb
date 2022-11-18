# frozen_string_literal: true

##
# https://github.com/thoughtbot/high_voltage#override
#
HighVoltage.configure do |config|
  config.routes = false

  config.content_path = "static"
end
