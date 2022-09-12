class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  before_action :authenticate_user!, except: [:top, :about,]

  def admin_url
    request.fullpath.include?("/admin")
  end

    # ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource_or_scope)
    if resource.is_a?(Admin)
      admin_root_path
    else
      root_path
    end
  end

end
