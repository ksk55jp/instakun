module ApplicationHelper
  def post_image(picture)
    if picture.image?
      image_url = picture.image
      alt_string = picture.title
    else
      image_url = 'no_image.jpg'
      alt_string = 'file not found'
    end
    return image_tag(image_url, alt: alt_string)
  end
end
