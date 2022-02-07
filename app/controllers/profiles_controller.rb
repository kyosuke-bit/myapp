class ProfilesController < ApplicationController
  before_action :set_target_profile, only: %i[show edit update]

  def show
  end

  def new
    @profile = Profile.new(user_id: current_user.id)
  end

  def create
    profile = Profile.new(profile_params)
    if profile.save
      flash[:notice] = "プロフィールを作成しました。"
      redirect_to profile_path
    else
      redirect_to new_profile_path, flash: {
        profile: profile,
        error_messages: profile.errors.full_messages
      }
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, flash: { notice: "プロフィールが更新されました  " }
    else
      redirect_to edit_profile_path, flash: {
        profile: @profile,
        error_messages: @profile.errors.full_messages
      }
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :birthday, :phone_number, :prefectures)
  end

  def set_target_profile
    @profile = current_user.profile
  end
end
