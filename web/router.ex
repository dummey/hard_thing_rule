defmodule HardThingRule.Router do
  use HardThingRule.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HardThingRule do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/challenges", ChallengeController, only: [:index, :show, :new, :create]
    resources "/check_ins", CheckInController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HardThingRule do
  #   pipe_through :api
  # end
end
