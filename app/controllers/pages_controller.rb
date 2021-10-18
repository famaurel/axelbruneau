class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  # , only: [:mentions, :presentation, :projet]
end
