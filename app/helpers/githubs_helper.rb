module GithubsHelper

  def is_favorite_repo(id)
    Favorite.repo.find_by(gid: id).present?
  end

  def is_favorite_user(id)
    Favorite.user.find_by(gid: id).present?
  end
end
