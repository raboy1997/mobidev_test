class GithubsController < ApplicationController

  def index
    @repo = Octokit.repo(10955751)
    @contributors = Octokit.contributors(10955751)
  end

  def search
    @repositories = Octokit.search_repositories(params[:repositories]).items.first(5)
  end

  def show
    @repo = Octokit.repo(params[:id].to_i)
    @contributors = Octokit.contributors(@repo.id)
  end

  def user
    @user = Octokit.user(params[:login])
    @favorite_user = Favorite.user.find_by(gid: @user[:login]).present?
  end

  def follow_user
    follow = Favorite.user.find_or_initialize_by(gid: params[:login])
    follow.save

    redirect_to user_path(params[:login])
  end

  def unfollow_user
    follow = Favorite.user.find_by(gid: params[:login])
    follow.destroy if follow.present?

    redirect_to user_path(params[:login])
  end

  def follow_repo

    follow = Favorite.repo.find_or_initialize_by(gid: params[:repo_id])
    follow.save
    redirect_to :back
  end

  def unfollow_repo
    follow = Favorite.repo.find_by(gid: params[:repo_id])
    follow.destroy if follow.present?
    redirect_to :back
  end


end
