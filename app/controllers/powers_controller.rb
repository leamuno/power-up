class PowersController < ApplicationController

  def show

  end

  def index
    @powers = Power.all
  end
end
