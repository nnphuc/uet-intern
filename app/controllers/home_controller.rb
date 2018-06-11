class HomeController < ApplicationController
  def index

  end

  def dangnhap
    if current_user 
      redirect_to(request.env['HTTP_REFERER'] || root_path)

    end
  end

  def thongbao
  end

  def congviec
  end

  def thuctap
  end

  def myprofile

  end

  def viewprofile

    @user = User.find_by id:params[:id]
    s = params[:role].to_sym
    
    if @user.nil? || !(@user.has_role? s) then
        render "/error/not_found"
    end


  end



  def update_info
    if current_user.has_role? :student
      @info = StudentInfo.new
    elsif current_user.has_role? :lecturer
      @info = LecturerInfo.new
    elsif current_user.has_role? :partner
      @info = PartnerInfo.new
    elsif current_user.has_role? :admin
    end

  end
  def update
    if current_user.has_role? :student 
      if current_user.student_info
        @info = current_user.student_info
        @info.update(student_info_params)
      else
        @info = StudentInfo.new(student_info_params)
        @info.user_id = current_user.id
        @info.save

      end
    elsif current_user.has_role? :partner
      if current_user.partner_info
        @info = current_user.partner_info
        @info.update(partner_info_params)
      else
        @info = PartnerInfo.new(partner_info_params)
        @info.user_id = current_user.id
        @info.save
      end
    elsif current_user.has_role? :lecturer
      if current_user.lecturer_info
        @info = current_user.lecturer_info
        @info.update(lecturer_info_params)
      else
        @info = LecturerInfo.new(lecturer_info_params)
        @info.user_id = current_user.id
        @info.save

      end
    elsif current_user.has_role? :admin
    end
  end
  private
  def student_info_params
    params.require(:student_info).permit(:avatar,:emailcanhan,:dienthoai,:skypeid,:facebook,
      :vitricanbo,:ngoaingu,:chungchi,:kinhnghiem,:mongmuon,:ghichu)
  end

  def lecturer_info_params
    params.require(:lecturer_info).permit(:avatar,:gmail,:ghichu)
  end
  def partner_info_params
    params.require(:partner_info).permit(:logo,:diachi,:dienthoai)
  end


  

end
