module ApplicationHelper
  def title(page_title, include_base_title = true)
    page_title += ' | AlbumFS' if include_base_title
    content_for(:title, page_title.to_s)
  end

  # Returns a string of "action_controller" that is useful for identifying the
  # page in CSS id/class names. 
  def location_name
    #Since we use high_voltage gem, the action_name will always be 'show' and the
    #controller_name will always be pages. Thus, we need to invoke the id of the
    #action to provide better context.
    if controller.controller_name == 'pages'
      return "#{params[:id]}_#{controller.controller_name}"
    end

    return "#{action_name}_#{controller.controller_name}"
  end
  
end
