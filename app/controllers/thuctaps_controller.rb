class ThuctapsController < ApplicationController
  before_action :set_thuctap, only: [:show, :edit, :update, :destroy]

  before_action :require_permission, only: [:edit,:update,:destroy]

  # GET /thuctaps
  # GET /thuctaps.json
  def index

    @page = params[:page]
    @thuctaps = Thuctap.all.order("created_at DESC").page @page
  end

  # GET /thuctaps/1
  # GET /thuctaps/1.json
  def show
  end

  # GET /thuctaps/new
  def new
    if !current_user || !(current_user.has_role?:partner)
        redirect_to thuctaps_path
    end
    @thuctap = Thuctap.new
    @thuctap.partner_info = current_user.partner_info
  end

  # GET /thuctaps/1/edit
  def edit
  end

  # POST /thuctaps
  # POST /thuctaps.json
  def create
    @thuctap = Thuctap.new(thuctap_params)
    respond_to do |format|
      if @thuctap.save
        format.html { redirect_to @thuctap, notice: 'Thuctap was successfully created.' }
        format.json { render :show, status: :created, location: @thuctap }
      else
        format.html { render :new }
        format.json { render json: @thuctap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thuctaps/1
  # PATCH/PUT /thuctaps/1.json
  def update
    respond_to do |format|
      if @thuctap.update(thuctap_params)
        format.html { redirect_to @thuctap, notice: 'Thuctap was successfully updated.' }
        format.json { render :show, status: :ok, location: @thuctap }
      else
        format.html { render :edit }
        format.json { render json: @thuctap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thuctaps/1
  # DELETE /thuctaps/1.json
  def destroy
    @thuctap.destroy
    respond_to do |format|
      format.html { redirect_to thuctaps_url, notice: 'Thuctap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def require_permission
        thuctap = Thuctap.find(params[:id])
        if !current_user || current_user != thuctap.partner_info.user
            redirect_to(thuctap_path(thuctap))
            #Or do something else here
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_thuctap
      @thuctap = Thuctap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thuctap_params
      params.require(:thuctap).permit(:partner_info_id, :title, :content, :address, :tag, :endtime)
    end
end
