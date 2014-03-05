class MuchWithdrawsController < ApplicationController
  before_action :set_much_withdraw, only: [:show, :edit, :update, :destroy]

  # GET /much_withdraws
  # GET /much_withdraws.json
  def index
    @much_withdraws = MuchWithdraw.all
  end

  # GET /much_withdraws/1
  # GET /much_withdraws/1.json
  def show
  end

  # GET /much_withdraws/new
  def new
    @much_withdraw = MuchWithdraw.new
  end

  # GET /much_withdraws/1/edit
  def edit
  end

  # POST /much_withdraws
  # POST /much_withdraws.json
  def create
    @much_withdraw = MuchWithdraw.new
    @much_withdraw.building_id = params[:building_id]
    @much_withdraw.such_date = Time.zone.now.to_datetime
    b = VeryBuilding.find_by_id(@much_withdraw.building_id)
    if(b.such_type=="SuchGenerator")
      @much_withdraw.amount = 100
      current_user.energy+=@much_withdraw.amount
    elsif
      @much_withdraw.amount = 10
      current_user.units+=@much_withdraw.amount
      current_user.energy-=@much_withdraw.amount*10
    end

    last_withdraw=MuchWithdraw.where(:building_id=>b.id).last

    respond_to do |format|
      if last_withdraw==nil
        @much_withdraw.save
        current_user.save
        format.html { redirect_to "/", notice: 'much withdraw so success' }
      elsif last_withdraw.such_date + 2*60*60 - Time.zone.now.to_datetime > 0
        format.html { redirect_to "/", notice: 'pls wait.' }
        format.json { render json: @very_loot.errors, status: :unprocessable_entity }
      elsif @much_withdraw.save
        current_user.save
        format.html { redirect_to "/", notice: 'much withdraw so success' }
        format.json { render action: 'show', status: :created, location: @much_withdraw }
      else
        format.html { redirect_to "/", notice: 'so error many sad'+(last_withdraw.such_date + 2*60*60 - Time.zone.now.to_datetime).to_s }
      end
    end
  end

  # PATCH/PUT /much_withdraws/1
  # PATCH/PUT /much_withdraws/1.json
  def update
    respond_to do |format|
      if @much_withdraw.update(much_withdraw_params)
        format.html { redirect_to "/", notice: 'much withdraw so success' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @much_withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /much_withdraws/1
  # DELETE /much_withdraws/1.json
  def destroy
    @much_withdraw.destroy
    respond_to do |format|
      format.html { redirect_to much_withdraws_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_much_withdraw
      @much_withdraw = MuchWithdraw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def much_withdraw_params
      params.require(:much_withdraw).permit(:building_id, :such_date, :amount)
    end
end
