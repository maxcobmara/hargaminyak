class Entity < ApplicationRecord
  validates :identifier, format: { with: /\A[a-z0-9_-]+\z/ }, allow_nil: true

  has_many :prices
end
