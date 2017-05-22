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
#            map.behaviors.disable('scrollZoom')
            map.geoObjects.add(result.geoObjects)

  parallax: ()->
    $('.parallax').each ()->
      $(window).scroll ()=>
        yPos = 100 - $(window).scrollTop() / 5
        $(this).css {backgroundPosition: "center #{yPos}px"}

  mount_fileupload: ()->
    files_to_upload = 0

    $('.upload-area').fileupload
      dataType: 'script'
      add: (e, data) ->
        files_to_upload += 1
        App.loading()
        data.submit().complete (result, textStatus, jqXHR) ->
          files_to_upload -= 1
          App.ready() if files_to_upload == 0

  loading: () ->
    $('.upload-area').addClass('loading')
    $('.upload-area').removeClass('ready')
    $('.loading-indicator').show()

  ready: () ->
    $('.upload-area').addClass('ready')
    $('.upload-area').removeClass('loading')
    $('.loading-indicator').hide()

App.init()