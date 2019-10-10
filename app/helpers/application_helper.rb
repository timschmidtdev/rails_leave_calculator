module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end

  def user_is_authorized_for_full_menu?
    current_user && (current_user.member? || current_user.admin?)
  end
end
