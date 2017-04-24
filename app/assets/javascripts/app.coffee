@App =
  name: 'OpticStyle'

  init: ()->
    console.info @name
    $(document).on 'turbolinks:load', ()=>
      @createMap()
      @parallax()


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
            map.geoObjects.add(result.geoObjects)

  parallax: ()->
    $('.parallax').each ()->
      $(window).scroll ()=>
        yPos = 100 - $(window).scrollTop() / 5
        $(this).css {backgroundPosition: "center #{yPos}px"}

App.init()