# frozen_string_literal: true

##
# https://github.com/thoughtbot/high_voltage#override
#
class StaticController < ApplicationController
  include HighVoltage::StaticPage

  ##
  # IMPORTANT: It is ok to disable forgery protection here since static content is trusted.
  #
  # Security warning: an embedded <script> tag on another site requested protected JavaScript. If you know what you're doing, go
  # ahead and disable forgery protection on this action to permit cross-origin JavaScript embedding.
  #
  protect_from_forgery except: :show

  before_action :authenticate_user!

  def show
    ##
    # NOTE: Needed to work in a similar way as `import` in JS.
    #
    params[:id] = existing_template_id || params[:id]

    ##
    # NOTE: Needed to serve js, json, etc files.
    #
    if extension.present?
      params.merge!(format: extension, id: template_id_without_extension)
    end

    super
  end

  private

  ##
  # NOTE: Works in a similar way as `import` in JS.
  # Tries to find the first existing template id.
  # For example, when `params[:id]` is "rules", it may return "rules" or "rules/index" or `nil`.
  #
  def existing_template_id
    original_template_id || fallback_template_id
  end

  ##
  # When `params[:id]` is "rules", then returns "rules" if such template exists, otherwise - `nil`.
  #
  def original_template_id
    name = params[:id]

    name if template_exists?("static/#{name}")
  end

  ##
  # When `params[:id]` is "rules", then returns "rules/index" if such template exists, otherwise - `nil`.
  #
  def fallback_template_id
    name = "#{params[:id]}/index"

    name if template_exists?("static/#{name}")
  end

  ##
  #
  #
  def extension
    File.extname(params[:id])
  end

  def template_id_without_extension
    params[:id].delete_suffix(extension)
  end
end
