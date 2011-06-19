module ApplicationHelper
  def title(page_title, include_base_title = true)
    page_title += ' | AlbumFS' if include_base_title
    content_for(:title, page_title.to_s)
  end
end
