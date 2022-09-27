class ApplicationController < ActionController::Base
  #before_action :authenticate_admin!, if: :admin_url
  #before_action :authenticate_user!, except: [:top, :about,]

  before_action :authenticate_user!, if: :public_url, except: [:top, :about, :requesting, :search, :index, :list]
  before_action :being_locked_out, except: [:top, :about, :requesting, :update, :search, :index, :list]

  def admin_url
    request.fullpath.include?("/admin")
  end

  def public_url

    request.path.include?("/public")
  end

  # ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource_or_scope)
    if resource.is_a?(Admin)
      admin_users_path
    else
      public_user_path(current_user.id)
    end
  end


  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  # "凍結中のユーザー"と"凍結解除申請中のユーザー"のページ遷移を制限するメソッド
  def being_locked_out
    if !request.path.include?("admin")
      if !request.path.include?("sign") && current_user.status == "locked_out"
        redirect_to public_requesting_path
      elsif !request.path.include?("sign") && current_user.status == "requesting"
        redirect_to public_requesting_path
      end
    end
  end

end
