class Public::ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    # 通報されたコンテンツを保存
    @posted_content = PostedContent.find(params[:posted_content_id])
    @report = current_user.reports.new(report_params)
    @report.posted_content_id = @posted_content.id
    @report.save
    #通報された投稿をもつユーザーのステイタスを、"通報され後判断待ち" に変える
    user = User.find(@posted_content.user_id)
    user.update(status: 5)
    flash[:notice] = "報告しました"
    redirect_to public_posted_content_path(@posted_content.id)
  end

  def destroy
    @report = PostedContent.find(params[:posted_content_id])
    @report = Report.find(params[:id])
    @report.destroy
  end


  private

  def report_params
    params.require(:report).permit(:reason, :posted_content_id, :user_id)
  end

end
