class ErrorFormBuilder < ActionView::Helpers::FormBuilder
  def error(*attribute_names)
    options = attribute_names.extract_options!

    if attribute_name = attribute_names.detect{ |n| object.errors.include?(n) }
      @template.content_tag(:div, object.errors[attribute_name].first, options.merge(:class => 'text-danger'))
    end
  end
end