class Favorite < ApplicationRecord

  enum kind: [:user, :repo]

end
