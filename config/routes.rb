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
  get "/rules/*id" => "rules#show", as: :rule, format: falses
end
