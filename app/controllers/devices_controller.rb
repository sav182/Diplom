class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @query = params[:q].to_s
    if @query.to_s != ''
      str = "%" + @query + "%"
      @devices = Device.full.where(["devices.name LIKE ? OR devices.model LIKE ? OR devices.type_device LIKE ? OR devices.type_poverh LIKE ? OR devices.form_poverh LIKE ? OR devices.cleanliness LIKE ? OR devices.complexity LIKE ?", str,str,str,str,str,str,str])
      .page(params[:page]).per(12)
    else
      @devices = Device.full.page(params[:page]).per(12)
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @device=Device.full.find(params[:id])
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Измерительный прибор успешно создан.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Измерительный прибор успешно обновлен.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Измерительный прибор успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :model, :type_device, :type_poverh, :form_poverh, :cleanliness, :complexity)
    end
end
