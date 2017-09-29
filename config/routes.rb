Rails.application.routes.draw do

  root 'githubs#index'

  get "/search" , to: "githubs#search" , as: 'search'

  get "/repositiry/:id" , to: "githubs#show" , as: 'repository'

  get "/user/:login", to: "githubs#user", as: 'user'

  get "/user/follow/:login", to: "githubs#follow_user", as: 'follow_user'
  get "/user/unfollow/:login", to: "githubs#unfollow_user", as: 'unfollow_user'

  get "/repositiry/follow/:repo_id", to: "githubs#follow_repo", as: 'follow_repo'
  get "/repositiry/unfollow/:repo_id", to: "githubs#unfollow_repo", as: 'unfollow_repo'

end
