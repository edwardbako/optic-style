module Admin::NotificationsHelper

  def notification_icon(icon)
    case icon
      when 'warning'
        fa_icon 'warning 2x'
      when 'danger'
        fa_icon('exclamation-circle 2x')
      when 'success'
        fa_icon 'check 2x'
      else
        fa_icon 'info 2x'
    end
  end
end
