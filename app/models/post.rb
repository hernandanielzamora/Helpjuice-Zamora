class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }

end
