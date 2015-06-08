class Post < ActiveRecord::Base

  validates :position, presence: true
  belongs_to :location

  mount_uploader :photo, AvatarUploader
  def user
    User.where 'post_ids @> ARRAY[?]', self.id
  end
end
