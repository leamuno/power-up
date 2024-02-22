class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @powers = Power.all.sample(3)
    @recent_powers = Power.order(created_at: :desc).limit(3)
  end
end
