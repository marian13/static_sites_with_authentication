# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  ##
  # @internal
  #   IMPORTANT: Regex must be as strict as it is possible.
  #   See `app/controllers/static_sites_controller.rb` for more info.
  #
  #   TAGS: static_sites
  #
  get "/:file", to: "static_sites#show", constraints: { file: /(#{STATIC_SITES.join("|")})\/?.*/ }, format: false
end
