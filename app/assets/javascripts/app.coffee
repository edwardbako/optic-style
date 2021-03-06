@App =
  name: 'OpticStyle'

  init: ()->
    console.info @name
    $(document).on 'turbolinks:load', ()=>
      @createMap()
      @parallax()
      @mount_fileupload()
      $('[data-toggle="tooltip"]').tooltip()

      $('#notice').fadeOut(5000, 'easeInQuart')

      @mount_caption_image_order()
      @update_backgrounds()

      App.carousel = new Carousel $(".carousel")[0]

      @scrollToTop()

      @mount_video_input()
      @mount_hide_notifications()
      @mount_input_mask()
      @mount_search_submit()

  mount_input_mask: ()->
    inputs = $('.phone-mask')
    for e in inputs
      IMask(e, {mask: '+7 (000) 000-00-00'})

  mount_search_submit: ()->
    $('input#search').on 'keyup', ()->
      $(@).form().submit()
#    if input.size() > 0
#      console.log form
#    else
#      console.log false

      if App.YTAPI.ready && $('#tv').length > 0
        App.YTAPI.initPlayer(App.YTAPI.videoId)
        App.YTAPI.rescale()

  mount_hide_notifications: ()->
    $("[data-dismiss='alert']").on 'click', ()->
      $.ajax(
        method: 'PUT'
        url: $(@).data('action')
      )

  createMap: ()->
    if $('#map').length > 0
      ymaps.ready ()->
        coords = [55.01, 82.92]

        map = new ymaps.Map('map', {
          center: coords,
          zoom: 12
        })

        $('.panel-title').each ()->
          geocoder = ymaps.geocode($(this).text())
          geocoder.then (result)->
            map.behaviors.disable('scrollZoom')
            map.geoObjects.add(result.geoObjects)

  parallax: ()->
    $('.parallax').each ()->
      bgsize = if $(window).innerWidth() < 768 then "1000px" else "cover"
      $(this).css {backgroundSize: bgsize}

      $(window).scroll ()=>
        scroll = $(window).scrollTop() + $(window).innerHeight()
        diff = scroll - $(this).position().top
        yPos = - diff / 6
        $(this).css {backgroundPosition: "center #{yPos}px"}

  mount_fileupload: ()->
    files_to_upload = 0
    @update_fileuploads()

    $('.upload-area').fileupload
      dataType: 'script',
      sequentialUploads: true
      add: (e, data) ->
        files_to_upload += 1
        App.loading(@)
        data.submit().complete (result, textStatus, jqXHR) =>
          files_to_upload -= 1
          App.ready(@) if files_to_upload == 0

  update_fileuploads: ()->
    for im in $(".upload-area[data-src]")
      $(im).css('background-image', "url(#{$(im).data('src')}?#{+new Date()}")
      $(im).removeAttr('data-src')

  loading: (e) ->
    $(e).removeClass('ready')
    $(e).addClass('loading')
    $(e).css('background-image', 'none')
    $(e).siblings('.loading-indicator').show()

  ready: (e) ->
    $(e).addClass('ready')
    $(e).removeClass('loading')
    $(e).siblings('.loading-indicator').hide()

  update_backgrounds: ()->
    for im in $("[data-image]")
      $(im).css('background-image', "url(#{$(im).data('image')})")

  scrollToTop: ()->
    element = $('.goto-up')

    element.on 'click', (e)->
      e.preventDefault()
      $('html, body').animate({ scrollTop: 0}, 1000, 'easeOutCirc')

    $(window).scroll ()->
      element.fadeIn(300) if $(window).scrollTop() > 400
      element.fadeOut(300) if $(window).scrollTop() < 400


  mount_caption_image_order: ()->
    $('a.caption-image-order-link').on 'click', (e)->
      e.preventDefault()

      order = $(@).siblings('.caption-image-order')
      fieldset = $(@).closest('.block-fields')
      if order.val() == 'left'
        fieldset.find('.caption-image-picture').removeClass('col-sm-push-8')
        fieldset.find('.caption-image-text').removeClass('col-sm-pull-4')
        order.val('right')
      else
        fieldset.find('.caption-image-picture').addClass('col-sm-push-8')
        fieldset.find('.caption-image-text').addClass('col-sm-pull-4')
        order.val('left')

  mount_video_input: ()->
    $('[data-video-url]').off 'keyup'
    timeout = null
    $('[data-video-url]').on 'keyup', ()->
      clearTimeout(timeout)
      timeout = setTimeout(()=>
        form = $(@).closest('form')
        $.post(form.attr('action'), form.serialize(), null, 'script')
      , 300)

App.init()
