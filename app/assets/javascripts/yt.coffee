App.YTAPI = {
  ready: false

  initPlayer: (videoId)->
    if videoId
      if @ready
        @player = new YT.Player('player',
          videoId: videoId
          playervars:
            showinfo: 0
            autoplay: 0
            fs: 1
          events:
            'onReay': App.YTAPI.onPlayerReady
            'onStateChange': API.YTAPI.onPlayerStateChange
        )
      else
        console.error "Youtube API haven't been loaded yet."
    else
      console.error "You haven't provided video ID or it is wrong."

  onPlayerReady: ()->

  onPlayerStateChange: ()->

  imageUri: (videoId)->
    "http://img.youtube.com/vi/#{videoId}/hqdefault.jpg"

}

window.onYouTubeIframeAPIReady = () ->
  App.YTAPI.ready = true