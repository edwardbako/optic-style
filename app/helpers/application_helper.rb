module ApplicationHelper
  def flash_class(name)
    mapping = {
      notice: :success,
      alert: :warning,
      error: :danger
    }.with_indifferent_access
    mapping.default = :info

    "alert-#{mapping[name]}"
  end

  def instagram_path
    'https://www.instagram.com/optikastyle59/'
  end

  def facebook_path
    'https://www.facebook.com/groups/1052722981459726'
  end

  def vk_path
    'https://vk.com/club121634817'
  end

  def custom_form_for(*args, &block)
    builder = {builder: CustomFormBuilder}

    args.size > 1 ? args[1].merge!(builder) : args << builder
    form_for *args, &block
  end

  def structured_data_tag(hash = {})
    content_tag :script, hash.to_json, {type: 'application/ld+json'}, false
  end

  def breadcrumbs_structured_data_items(links)
    result = []
    counter = 1
    links.each do |name, path|
      item = {'@id' => (name == :current ? request.original_url : path),
              'name' => (name == :current ? path : name) }
      result << {'@type' => 'ListItem',
                 'position' => counter,
                 'item' => item
      }
      counter += 1
    end
    result
  end

end
