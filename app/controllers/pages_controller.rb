class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @powers = Power.all.where.not(user: current_user).sample(3)
    @recent_powers = Power.where.not(user: current_user).order(created_at: :desc).limit(3)
  end
end
