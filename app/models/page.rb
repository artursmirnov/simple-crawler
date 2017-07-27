class Page < ApplicationRecord
  has_many :contents
  validates :url, presence: true, format: { with: /\Ahttps*:\/\/.+\..+\z/i }
end
