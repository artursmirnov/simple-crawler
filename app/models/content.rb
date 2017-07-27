class Content < ApplicationRecord
  belongs_to :page

  validates :kind, presence: true
  validates :page_id, presence: true
end
