class MsgsController < ApplicationController
  before_action :set_msg, only: [:show, :edit, :update, :destroy]
  before_action :valid, except: []
  before_action :owned,only: [:edit,:update,:destroy]
  # GET /msgs
  # GET /msgs.json
  def index
    @msgs = Msg.where(sender_id: current_user.id).or(Msg.where(receiver_id:current_user.id))
    
  end

  # GET /msgs/1
  # GET /msgs/1.json
  def show
  end

  # GET /msgs/new
  def new
    
    @msg = Msg.new
  end

  # GET /msgs/1/edit
  def edit
  end

  # POST /msgs
  # POST /msgs.json
  def create
    @msg = Msg.new(msg_params)

    respond_to do |format|
      if @msg.save
        format.html { redirect_to @msg, notice: 'Msg was successfully created.' }
        format.json { render :show, status: :created, location: @msg }
      else
        format.html { render :new }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /msgs/1
  # PATCH/PUT /msgs/1.json
  def update
    respond_to do |format|
      if @msg.update(msg_params)
        format.html { redirect_to @msg, notice: 'Msg was successfully updated.' }
        format.json { render :show, status: :ok, location: @msg }
      else
        format.html { render :edit }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msgs/1
  # DELETE /msgs/1.json
  def destroy
    if @msg.sender == current_user
        @msg.destroy
    end
    respond_to do |format|
      format.html { redirect_to msgs_url, notice: 'Msg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def owned
        if @msg.sender!=current_user
            redirect_to msgs_path
        end
    end
    def set_msg
      @msg = Msg.find(params[:id])
    end
    def valid 
  
        if !current_user
            redirect_to root_path
            @people =[]
        else
            @people = current_user.followers + current_user.following
        end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def msg_params
      params.require(:msg).permit(:sender_id, :receiver_id, :title, :content,:document)
    end
end
