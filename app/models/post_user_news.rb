class PostUserNews < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :user_from,    :class_name => "User", :foreign_key => "user_id_from"

  validates :reason_trigger,  :presence => true
  validates :reason_why,      :presence => true

  def reason
    T.t "notifications.simple.trigger_#{self.reason_trigger}_why_#{self.reason_why}"
  end

  def has_post?
    !!self.attributes['post_id']
  end

  #reason_trigger    # what triggered this PUN creation?  -- the PFo reason
  #REASON_MENTIONED  = 'mentioned'
  #REASON_CREATED    = 'created'
  #REASON_LIKED      = 'liked'
  #REASON_COMMENTED  = 'commented'
  #REASON_REPOSTED   = 'reposted'

  #reason_why        # why am I following this post?  -- the PFo reason
  #REASON_MENTIONED  = 'mentioned'
  #REASON_CREATED    = 'created'
  #REASON_LIKED      = 'liked'
  #REASON_COMMENTED  = 'commented'
  #REASON_REPOSTED   = 'reposted'
  
end
