# frozen_string_literal: true

##
# @internal
#   TAGS: static_sitesS
#
class StaticSitesController < ApplicationController
  class File
    ##
    # @!attribute [r] input
    #   @return [String]
    #
    attr_reader :input

    ##
    # @param input [String]
    # @return [void]
    #
    def initialize(input:)
      @input = input
    end

    ##
    # @return [String]
    #
    def name
      @name ||= input.delete_suffix(".#{extension}")
    end

    ##
    # @return [String]
    #
    def extension
      @extension ||= ::File.extname(input).delete_prefix(".")
    end

    ##
    # @return [String]
    #
    def path
      @path ||= extension.present? ? "#{name}.#{extension}" : name
    end

    ##
    # @return [String]
    #
    def absolute_path
      @absolute_path ||= ::File.expand_path(::File.join(::Rails.root, "app", "views", "static_sites", path))
    end

    ##
    # @return [Array<StaticSitesController::File>]
    #
    # @internal
    #   NOTE: Works in a similar way as `import` in JS.
    #   For example, when file `name` is "code_notes", then its alternative file names are "code_notes.html" or "code_notes/index.html".
    #
    def alternative_files
      @alternative_files ||=
        case
        when extension.blank?
          [File.new(input: "#{name}.html"), File.new(input: ::File.join(name, "index.html"))]
        when extension == "html"
          [File.new(input: ::File.join(name, "index.html"))]
        else
          []
        end
    end

    ##
    # @return [Boolean]
    #
    # @internal
    #   NOTE: `File.exist?` return `true` for folders. That is why additional `!::Dir.exist?` is added.
    #
    def exist?
      @exist = !::Dir.exist?(absolute_path) && ::File.exist?(absolute_path)
    end
  end

  ##
  # @internal
  #   IMPORTANT: It is OK to disable forgery protection here since static content is trusted.
  #   As a result, `protect_from_forgery except: :show` suppresses the following warning:
  #
  #     Security warning: an embedded <script> tag on another site requested protected JavaScript.
  #     If you know what you're doing, go ahead and disable forgery protection on this action to permit cross-origin JavaScript embedding.
  #
  protect_from_forgery except: :show

  ##
  # @internal
  #   NOTE: Places `authenticate_user!` that is inherited from `ApplicationController` after `protect_from_forgery`.
  #   This way all static sites are authenticated.
  #
  before_action :authenticate_user!

  ##
  # @return [void]
  #
  def show
    case
    when file.exist?
      render file: file.absolute_path
    when file.alternative_files.any?(&:exist?)
      render file: file.alternative_files.find(&:exist?).absolute_path
    else
      render_not_found
    end
  end

  private

  ##
  # @return [StaticSitesController::File]
  #
  def file
    @file ||= File.new(input: params[:file])
  end

  ##
  # @internal
  #   - https://stackoverflow.com/a/4983354/12201472
  #
  def render_not_found
    raise ::ActionController::RoutingError
  end
end
