class User < ApplicationRecord
  has_many :places
  has_many :posts
end
