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
end
