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


      App.carousel = new Carousel $(".carousel")[0]

      @scrollToTop()

      @mount_video_input()



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
      $(window).scroll ()=>
        yPos = 100 - $(window).scrollTop() / 5
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
