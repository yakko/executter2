class StartOverAndRemoveUserUploads < ActiveRecord::Migration
  def self.up
    UserPhoto.find_each(&:destroy)
    User.update_all user_photo_id: nil, cached_photo_url: UserPhoto.new.image.url
    Post.where("image_file_name is not null").find_each { |p| p.image=nil && p.link_url=nil && p.save! }
  end

  def self.down
  end
end
