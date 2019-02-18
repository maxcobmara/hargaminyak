module PagesHelper

  def new_icon
    "<i class='icon icon-plus'></i>".html_safe
  end

  def show_icon
    "<i class='icon icon-more-horiz'></i> &nbsp;".html_safe
  end

  def edit_icon
    "<i class='icon icon-edit'></i> &nbsp;".html_safe
  end

  def trash_icon
    "<i class='icon icon-delete'></i> &nbsp;".html_safe
  end
end
