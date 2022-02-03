class ProfilesController < ApplicationController
  before_action :set_target_profile

  def show
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path, flash: { notice: "プロフィールが更新されました  " }
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :birthday, :phone_number, :prefectures)
  end

  def set_target_profile
    @profile = current_user.profile
  end
end
