class window.Carousel

  ease: 'easeOutQuint'
  duration: 500

  constructor: (e)->
    @element = $(e)
    @nextBtn = @element.find(".carousel-next a.act")
    @previousBtn = @element.find(".carousel-previous a.act")
    @images = @element.find("img").toArray()
    @size = @images.length
    @currentPos = 0
    @startPositions()
    @dots = $(".dots .dot").toArray()
    $(@dots[@currentPos % @size]).switchClass('fa-circle-o', 'fa-circle')

    @previousBtn.on 'click', (e)=>
      e.preventDefault()
      @previous()

    @nextBtn.on 'click', (e)=>
      e.preventDefault()
      @next()

  startPositions: ()->
    @currentPos += @size if @currentPos < @size

    $(@images[@currentPos % @size]).addClass('active')
    $(@images[(@currentPos - 1) % @size]).addClass('previous') if @size > 1
    $(@images[(@currentPos + 1) % @size]).addClass('next') if @size > 1

  next: ()->
    @nextBtn.addClass('disabled')
    $(@dots[@currentPos % @size]).switchClass('fa-circle', 'fa-circle-o')

    $(@images[(@currentPos - 1) % @size]).removeClass('previous')

    @currentPos += 1
    $(@dots[@currentPos % @size]).switchClass('fa-circle-o', 'fa-circle')

    $(@images[(@currentPos - 1) % @size]).switchClass('active', 'previous', @duration, @ease, ()=>
      $(@images[(@currentPos + 1) % @size]).addClass('next')
      @nextBtn.removeClass('disabled')
    )
    $(@images[@currentPos % @size]).switchClass('next', 'active', @duration, @ease, ()->
      $(this).removeAttr('style')
    )

  previous: ()->
    @currentPos += @size if @currentPos < @size

    @previousBtn.addClass('disabled')
    $(@dots[@currentPos % @size]).switchClass('fa-circle', 'fa-circle-o')

    $(@images[(@currentPos + 1) % @size]).removeClass('next')

    @currentPos -= 1
    $(@dots[@currentPos % @size]).switchClass('fa-circle-o', 'fa-circle')

    $(@images[(@currentPos + 1) % @size]).switchClass('active', 'next', @duration, @ease, ()=>
      $(@images[(@currentPos - 1) % @size]).addClass('previous')
      @previousBtn.removeClass('disabled')
    )
    $(@images[@currentPos % @size]).switchClass('previous', 'active', @duration, @ease, ()->
      $(this).removeAttr('style')
    )


