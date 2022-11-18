# frozen_string_literal: true

Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  ##
  # https://github.com/thoughtbot/high_voltage#override
  #
  # get "/rules" => "pages#show", format: false, defaults: {id: "index"}
  # get "/rules/*id" => "pages#show", format: false, defaults: {id: "index"}

  ##
  # IMPORTANT: Regex must be as strict as it is possible.
  # See `app/controllers/static_controller.rb`.
  #
  get '/:id', to: "static#show", constraints: { id: /(rules)\/?.*/ }
end
