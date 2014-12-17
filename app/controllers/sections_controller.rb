class SectionsController < ApplicationController
  before_action :set_section, only: [:edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    @query = params[:q].to_s
    if @query.to_s != ''
      str = "%" + @query + "%"
      @sections = Section.full.where(["sections.name LIKE ? OR sections.drawing LIKE ? OR sections.inventory_number LIKE ?", str,str,str])
      .page(params[:page]).per(12)
    else
      @sections = Section.full.page(params[:page]).per(12)
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section=Section.full.find(params[:id])
    cleanlines = @section.asperity.try(:complexity)
    @machines = []
    @machines = Machine.where('cleanliness = ?', cleanlines).all unless cleanlines.nil?
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Деталь успешно создана.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Деталь успешно обновлена.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Деталь успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:name, :drawing, :inventory_number)
    end
end
