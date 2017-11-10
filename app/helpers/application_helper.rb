module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name)
  end

  def event_img(collection)
    return image_tag(collection.picture, alt: collection.title) if collection.picture?
    if collection.picture.blank?
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: collection.title)
  end
end
