module ApplicationHelper
  def title(page_title, include_base_title = true)
    page_title += ' | AlbumFS' if include_base_title
    content_for(:title, page_title.to_s)
  end

  # Returns a string of "action_controller" that is useful for identifying the
  # page in CSS id/class names.
  def location_name
    "#{action_name}_#{controller.controller_name}"
  end
  
end
