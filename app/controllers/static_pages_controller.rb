class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page])
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
