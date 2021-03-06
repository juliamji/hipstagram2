module ApplicationHelper
  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(post)
    return image_tag post.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive' if post.image.exists?
    image_tag 'farhan-siddicq-163846.jpg', id: 'image-preview', class: 'img-responsive'
  end

  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'ethan-robertson-134952.jpg', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end
end
