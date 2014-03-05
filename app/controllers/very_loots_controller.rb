class VeryLootsController < ApplicationController
  before_action :set_very_loot, only: [:show, :edit, :update, :destroy]

  # GET /very_loots
  # GET /very_loots.json
  def index
    @very_loots = VeryLoot.all
  end

  # GET /very_loots/1
  # GET /very_loots/1.json
  def show
  end

  # GET /very_loots/new
  def new
    @very_loot = VeryLoot.new
  end

  # GET /very_loots/1/edit
  def edit
  end

  # POST /very_loots
  # POST /very_loots.json
  def create
    @very_loot = VeryLoot.new

    @very_loot.such_date = Time.zone.now.to_datetime
    @very_loot.user_id = current_user.id
    @very_loot.amount = 200
    u=User.find_by_id(current_user.id)
    u.energy+=200

    respond_to do |format|
      if VeryLoot.where(:user_id => current_user.id).last==nil
        @very_loot.save
        u.save
        format.html { redirect_to "/", notice: 'Very loot was successfully created.' }
      elsif VeryLoot.where(:user_id => current_user.id).last.such_date + 2*60*60 - Time.zone.now.to_datetime > 0
        format.html { redirect_to "/", notice: 'pls wait.' }
        format.json { render json: @very_loot.errors, status: :unprocessable_entity }
      elsif @very_loot.save
        u.save
        format.html { redirect_to "/", notice: 'very loot' }
      else
        format.html { render action: 'new' }
        format.json { render json: @very_loot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /very_loots/1
  # PATCH/PUT /very_loots/1.json
  def update
    respond_to do |format|
      if @very_loot.update(very_loot_params)
        format.html { redirect_to @very_loot, notice: 'Very loot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @very_loot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /very_loots/1
  # DELETE /very_loots/1.json
  def destroy
    @very_loot.destroy
    respond_to do |format|
      format.html { redirect_to very_loots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_very_loot
      @very_loot = VeryLoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def very_loot_params
      params.require(:very_loot).permit(:user_id, :amount, :such_date)
    end
end
