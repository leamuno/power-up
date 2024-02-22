class PowersController < ApplicationController

  def index
    @powers = Power.where.not(user: current_user)
    if params[:powersearch].present? || params[:category].present?
      sql_query = <<~SQL
      name ILIKE :q OR
      description ILIKE :q OR
      users.first_name ILIKE :q OR
      users.last_name ILIKE :q
      SQL
      @powers = @powers.joins(:user).where(sql_query, q: "%#{params[:powersearch]}%") if params[:powersearch].present?
      @powers = @powers.where('category @@ ?', params[:category]) if params[:category].present?
    end
  end

  def show
    @power = Power.find(params[:id])
    @booking = Booking.new
    @bookings = @power.bookings.where(user: current_user)
    @related_powers = Power.where(category: @power.category).where.not(id: @power.id).limit(3)
  end

  def new
    @power = Power.new()
  end

  def edit
    @power = Power.find(params[:id])
  end

  def update
    @power = Power.find(params[:id])
    if @power.update(power_params)
      redirect_to edit_user_registration_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @power = Power.new(power_params)
    @power.user = current_user
    if @power.save
      redirect_to edit_user_registration_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @power = Power.find(params[:id])
    @power.destroy
    redirect_to edit_user_registration_path, status: :see_other
  end

  private

  def power_params
    params.require(:power).permit(:name, :description, :category, :photo, :price)
  end
end
