module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.jpg?id=identicon&s=50"
  end      
end
