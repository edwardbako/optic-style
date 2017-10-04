class SuperAdminController < AdminController
  before_action :check_admin_role
  layout 'admin'

  def check_admin_role
    unless current_user.admin?
      flash[:error] = <<EOS
<p class='text-center'>Для доступа в этот раздел нужны дополнительные права.</p>
<p class='text-center'>Запросите их у вашего администратора.</p>
EOS
      redirect_to admin_path
    end
  end
end