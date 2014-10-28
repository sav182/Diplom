class AsperitiesController < ApplicationController
  before_action :set_asperity, only: [:show, :edit, :update, :destroy]

  # GET /asperities
  # GET /asperities.json
  def index
    @query = params[:q].to_s
    if @query.to_s != ''
      str = "%" + @query + "%"
      @asperities = Asperity.full.where(["asperities.number LIKE ? OR asperities.drawing LIKE ? OR asperities.form LIKE ? OR asperities.type LIKE ?", str,str,str,str])
      .page(params[:page]).per(12)
    else
      @asperities = Asperity.full.page(params[:page]).per(12)
    end
  end

  # GET /asperities/1
  # GET /asperities/1.json
  def show
    @asperity=Asperity.full.find(params[:id])
  end

  # GET /asperities/new
  def new
    @asperity = Asperity.new
  end

  # GET /asperities/1/edit
  def edit
  end

  # POST /asperities
  # POST /asperities.json
  def create
    @asperity = Asperity.new(asperity_params)

    respond_to do |format|
      if @asperity.save
        format.html { redirect_to @asperity, notice: 'Шероховатость успешно создана.' }
        format.json { render :show, status: :created, location: @asperity }
      else
        format.html { render :new }
        format.json { render json: @asperity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asperities/1
  # PATCH/PUT /asperities/1.json
  def update
    respond_to do |format|
      if @asperity.update(asperity_params)
        format.html { redirect_to @asperity, notice: 'Шероховатость успешно обновлена.' }
        format.json { render :show, status: :ok, location: @asperity }
      else
        format.html { render :edit }
        format.json { render json: @asperity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asperities/1
  # DELETE /asperities/1.json
  def destroy
    @asperity.destroy
    respond_to do |format|
      format.html { redirect_to asperities_url, notice: 'Шероховатость успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asperity
      @asperity = Asperity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asperity_params
      params.require(:asperity).permit(:number, :drawing, :form, :type, :section_id, :device_id)
    end
end
