module ApplicationHelper
  def admin_label(field_name, cntr_name = nil)
    cntr_name ||= controller_path.sub(%r{^admin\/}, '').singularize
    t("activerecord.attributes.#{cntr_name}.#{field_name}")
  end

  def admin_form_id
    if action_name == 'new' || action_name == 'create'
      "new_#{controller_name.singularize}_form"
    else
      "edit_#{controller_name.singularize}_form"
    end
  end

  def admin_form_attributes
    {
      url: resource.persisted? ? resource_path(resource.id) : resources_path,
      html: { class: 'form-horizontal', id: admin_form_id }
    }
  end

  def navigation_columns(items)
    if items.count >= 15
      3
    elsif items.count >= 8
      2
    else
      1
    end
  end
end
