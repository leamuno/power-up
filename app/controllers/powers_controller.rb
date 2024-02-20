class PowersController < ApplicationController

  def index
    @powers = Power.all
  end
end
