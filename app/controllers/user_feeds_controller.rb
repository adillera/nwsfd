class UserFeedsController < ApplicationController
  def index
    all_feeds = Feed.all
    @feeds = current_user.feeds
    @feeds_collection = all_feeds - @feeds
    @user_feed = current_user.user_feeds.new
  end

  def create
    begin
      current_user.user_feeds.create(permitted_data)
      flash[:success] = t('flash.successfully_added_rss_feed_to_the_list')
    rescue
      flash[:error] = t('flash.could_not_add_rss_feed_to_the_list')
    end

    redirect_to action: :index
  end

  def destroy
    begin
      user_feed = current_user.user_feeds.find_by_feed_id(params[:id])
      user_feed.delete

      flash[:success] = t('flash.successfully_deleted_rss_feed_from_the_list')
    rescue
      flash[:error] = t('flash.could_not_add_rss_feed_to_the_list')
    end

    redirect_to action: :index
  end

  private
  def permitted_data
    params[:user_feed].permit(
      :feed_id
    )
  end
end
