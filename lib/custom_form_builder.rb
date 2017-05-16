class CustomFormBuilder < ActionView::Helpers::FormBuilder

  def label(method, options = {}, text = nil, &block)
    str = "#{text ? text : object.class.human_attribute_name(method.to_s)} #{object.errors[method].join(', ')}"
    super(method, str, options.merge({class: 'control-label'}), &block)
  end

  def error_label(method, *args)
    if object.errors[method].any?
      label method, *args
    else
      '<br>'.html_safe if object.errors.any?
    end
  end

  [:text_field, :text_area, :email_field, :password_field, :number_field].each do |meth|
    define_method meth do |method, options = {}|
      super(method, options.merge({class: 'form-control'}))
    end
  end

  def check_box(method, *args)
    super(method, *args) + object.class.human_attribute_name(method.to_s)
  end
end