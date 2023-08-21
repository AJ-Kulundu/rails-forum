class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :body, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :community_id, presence: true

  scope :community, ->(id) { where(community_id: id) }
  scope :user, ->(id) { where(user_id: id) }
  scope :ordered, -> { order(created_at: :desc) }
end
