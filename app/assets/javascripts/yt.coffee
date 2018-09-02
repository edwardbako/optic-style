App.YTAPI = {
  ready: false
  videoId: '7kFb7lwzsqw'

  initPlayer: (videoId)->
    if videoId
      if @ready
        if $('#tv').length > 0
          @player = new YT.Player('tv',
            videoId: videoId
            width: $(window).width()
            height: $(window).width()/16*9
            playerVars:
              playlist: ['7kFb7lwzsqw']
              showinfo: 0
              loop: 1
              autoplay: 1
              autohide: 1
              modestbranding: 0
              rel: 0
              controls: 0
              disablekb: 1
              enablejsapi: 0
              iv_load_policy: 3
            events:
              'onReady': App.YTAPI.onPlayerReady
              'onStateChange': App.YTAPI.onPlayerStateChange
          )
        else
          console.log "There is no container for video on this page."
      else
        console.error "Youtube API haven't been loaded yet."
    else
      console.error "You haven't provided video ID or it is wrong."

  onPlayerReady: ()->
    player = App.YTAPI.player
    player.mute()

  onPlayerStateChange: (e)->
    if e.data == 1
      $('#tv').removeClass('nonactive')
      $('#tv').addClass('active')
    else if e.data = 3
      $('#tv').removeClass('active')
      $('#tv').addClass('nonactive')

  rescale: ()->
    player = App.YTAPI.player
    w = $(window).width()
    h = $(window).height()
    if w/h > 16/9
      player.setSize(w, w/16*9)
      $()
      $('#tv').css(left: 0, top: 0)
    else
      player.setSize(h/9*16, h)
      $('#tv').css(left: -($('#tv').outerWidth()-w)/2, top: 0)

  imageUri: (videoId)->
    "http://img.youtube.com/vi/#{videoId}/hqdefault.jpg"

}

window.onYouTubeIframeAPIReady = () ->
  App.YTAPI.ready = true

  App.YTAPI.initPlayer(App.YTAPI.videoId)

$(window).on('load resize', ()->
  if App.YTAPI.player != undefined
    App.YTAPI.rescale()
)

$(document).on 'turbolinks:load', ()->
  App.YTAPI.ready = true

  App.YTAPI.initPlayer(App.YTAPI.videoId)
