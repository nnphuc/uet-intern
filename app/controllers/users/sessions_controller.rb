# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
     super
     if current_user.has_role? :student
        if !current_user.student_fixed_info
            current_user.student_fixed_info = StudentFixedInfo.new
            current_user.student_fixed_info.user_id = current_user.id
            current_user.student_fixed_info.save
            current_user.student_info = StudentInfo.new
            current_user.student_info.user_id = current_user.id
            current_user.student_info.save
        end 
    end
    if current_user.has_role? :partner
        if !current_user.partner_info
         
            current_user.partner_info = PartnerInfo.new
            current_user.partner_info.user_id = current_user.id
            current_user.partner_info.save
        end 
    end
    if current_user.has_role? :lecturer
        if !current_user.lecturer_info
         
            current_user.lecturer_info = LecturerInfo.new
            current_user.lecturer_info.user_id = current_user.id
            current_user.lecturer_info.save
        end 
    end

  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
