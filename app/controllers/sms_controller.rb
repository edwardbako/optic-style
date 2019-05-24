class SmsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before_action :check_origin

  TRUSTED_ORIGINS = %w(https://sms.ru http://localhost:3000)
  STATUS_MAP = {"-1"=>"Сообщение не найдено\n",
                "100"=>"Запрос выполнен или сообщение находится в нашей очереди\n",
                "101"=>"Сообщение передается оператору\n",
                "102"=>"Сообщение отправлено (в пути)\n",
                "103"=>"Сообщение доставлено\n",
                "104"=>"Не может быть доставлено: время жизни истекло\n",
                "105"=>"Не может быть доставлено: удалено оператором\n",
                "106"=>"Не может быть доставлено: сбой в телефоне\n",
                "107"=>"Не может быть доставлено: неизвестная причина\n",
                "108"=>"Не может быть доставлено: отклонено\n",
                "110"=>"Сообщение прочитано\n",
                "150"=>"Не может быть доставлено: не найден маршрут на данный номер\n",
                "200"=>"Неправильный api_id\n",
                "201"=>"Не хватает средств на лицевом счету\n",
                "202"=>"Неправильно указан номер телефона получателя, либо на него нет маршрута\n",
                "203"=>"Нет текста сообщения\n",
                "204"=>"Имя отправителя не согласовано с администрацией\n",
                "205"=>"Сообщение слишком длинное (превышает 8 СМС)\n",
                "206"=>"Будет превышен или уже превышен дневной лимит на отправку сообщений\n",
                "207"=>"На этот номер нет маршрута для доставки сообщений\n",
                "208"=>"Параметр time указан неправильно\n",
                "209"=>"Вы добавили этот номер (или один из номеров) в стоп-лист\n",
                "210"=>"Используется GET, где необходимо использовать POST\n",
                "211"=>"Метод не найден\n",
                "212"=>"Текст сообщения необходимо передать в кодировке UTF-8 (вы передали в другой кодировке)\n",
                "213"=>"Указано более 100 номеров в списке получателей\n",
                "220"=>"Сервис временно недоступен, попробуйте чуть позже\n",
                "230"=>"Превышен общий лимит количества сообщений на этот номер в день\n",
                "231"=>"Превышен лимит одинаковых сообщений на этот номер в минуту\n",
                "232"=>"Превышен лимит одинаковых сообщений на этот номер в день\n",
                "233"=>"Превышен лимит отправки повторных сообщений с кодом на этот номер за короткий промежуток времени (\"защита от мошенников\", можно отключить в разделе \"Настройки\")\n",
                "300"=>"Неправильный token (возможно истек срок действия, либо ваш IP изменился)\n",
                "301"=>"Неправильный api_id, либо логин/пароль\n",
                "302"=>"Пользователь авторизован, но аккаунт не подтвержден (пользователь не ввел код, присланный в регистрационной смс)\n",
                "303"=>"Код подтверждения неверен\n",
                "304"=>"Отправлено слишком много кодов подтверждения. Пожалуйста, повторите запрос позднее\n",
                "305"=>"Слишком много неверных вводов кода, повторите попытку позднее\n",
                "500"=>"Ошибка на сервере. Повторите запрос.\n",
                "901"=>"Callback: URL неверный (не начинается на http://)\n",
                "902"=>"Callback: Обработчик не найден (возможно был удален ранее)"}


  def callback
    update_sms(params['data']['0'])

    render plain: 100
  end

  private

  def check_origin
    binding.pry
    unless TRUSTED_ORIGINS.include? request.headers['origin']
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def update_sms(data)
    data = data.split("\n")
    sms = Client::Sms.where(sms_id: data[1]).first
    sms.update(status: data[2].to_i, status_text: STATUS_MAP[data[2]])
  end

end