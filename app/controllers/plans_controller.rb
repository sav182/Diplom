class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
	@query = params[:q].to_s
    if @query.to_s != ''
      @plans = Plan.all.where(["plans.name LIKE ? OR plans.year LIKE ?", "%" + @query + "%", "%" + @query + "%"])
      .page(params[:page]).per(12)
    else
      @plans = Plan.full.page(params[:page]).per(12)
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'План успешно создан' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    #raise plan_params().inspect
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'План успешно обновлен' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'План успешно удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name, :year, :count_product, :product_id, :section_id, :count_section,)
    end

    def check_add
      render_error(plans_path) unless Plan.add?(@current_user)
    end

    def check_edit
      render_error(@plan) unless @plan.edit?(@current_user)
    end
end
