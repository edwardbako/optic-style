class ContactsController < ApplicationController

  def index
    @titles_list += ['Салоны оптики в Новосибирске']
    @meta_description = <<EOS
Адреса, номера телефонов и время работы салонов оптики в Новосибирске.
Ознакомьтесь с каталогом солнцезащитных очков, оправ для зрения и контактных линз.
EOS
  end

  def show
    @branch = Branch.find params[:id]

    @titles_list += ["Салон оптики по адресу #{@branch.short_address}"]
    @meta_description = <<EOS
Режим работы и контакные телефоны салона оптики по адресу #{@branch.short_address}.
Смотрите схему проезда на карте Новосибирска.
EOS
  end
end