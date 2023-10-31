# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  ##
  # - https://github.com/thoughtbot/high_voltage#override
  #
  # IMPORTANT: Regex must be as strict as it is possible.
  # See `app/controllers/static_sites_controller.rb`.
  #
  get '/:id', to: "static_sites#show", constraints: { id: /(code_notes)\/?.*/ }
end
