module ApplicationHelper

  def avatar_url(element)
    if element.photo.attached?
      cl_image_tag element.photo.key, class: "avatar-fat"
    else
      image_tag("COACH SEEKER.png", class: "avatar-fat")
    end
  end
end

def photo_url(element)
  if element.photo.attached?
    cl_image_path element.photo.key, height: 400, width: 1000, crop: :fill, class: "avatar-fat"
  else
    image_tag("COACH SEEKER.png")
  end
end

def avatar_navbar(element)
  if element.photo.attached?
    cl_image_tag(element.photo.key, crop: :fill, gravity: :face, class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
  else
    image_tag("COACH SEEKER.png", class: "avatar dropdown-toggle", id: "navbarDropdown", data: { toggle: "dropdown" }, 'aria-haspopup': true, 'aria-expanded': false)
  end
end
