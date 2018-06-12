class Partner::ThuctapController < ApplicationController
    before_action :find_id,only: [:index]
    
    def index
        if @user && @user.partner_info && (@user.has_role? :partner)
            @page = params[:page]


            @thuctaps = @user.partner_info.thuctaps.order("created_at DESC").page @page
        else
            render "/error/not_found"
        end
    end

    private

    def find_id
        @user = User.find_by id:params[:id]
        if @user.nil?
            render "/partner/not_found"
        end
    end

end
