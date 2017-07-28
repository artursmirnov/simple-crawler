class Page < ApplicationRecord
  has_many :contents, dependent: :destroy

  validates :url, presence: true, format: { with: /\Ahttps*:\/\/.+\..+\z/i }
end
