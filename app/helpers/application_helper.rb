module ApplicationHelper
  def responsive_image_tag src, extra_classes=nil
    image_tag src, class: "img-responsive#{" #{extra_classes}" if extra_classes}"
  end
end
