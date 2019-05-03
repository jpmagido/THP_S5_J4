class Gossip < ApplicationRecord
	belongs_to :user

	has_many :join_table_tag_gossips
	has_many :tags, through: :join_table_tag_gossips

	validates :title, length: { in: 3..15}
	validates :content, presence: true
	#validates :user_id, presence: false
	#validates :user, presence: false

end
