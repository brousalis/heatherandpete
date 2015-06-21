$ ->
  if $(window).width() > 1024
    s = skrollr.init(forceHeight: false)
    s.refresh $('.guest_wrapper, .our_story')

  $('section, .parallax').each ->
    image = $(this).attr('data-image')
    if image
      $(this).css 'background-image', 'url(' + image + ')'
    return

  $('.intro_down, .go').on 'click', (e) ->
    anchor = $(this)
    $('html, body').stop().animate { scrollTop: $(anchor.attr('href')).offset().top }, 1000
    e.preventDefault()
    return

  $('.guest_wrapper').owlCarousel
    navigation: true
    pagination: false
    responsive: true
    responsiveRefreshRate: 200
    slideSpeed: 200
    scrollPerPage: true
    paginationSpeed: 200
    rewindSpeed: 500
    stopOnHover: true
    autoHeight: false
    items: 4
    mouseDrag: false
    autoPlay: false

  $('#countdown').countdown '2015/11/14', (event) ->
    totalDays = event.offset.totalDays
    $(this).find('.days').html totalDays
    $(this).find('.hours').html event.strftime('%H')
    $(this).find('.minutes').html event.strftime('%M')
    $(this).find('.seconds').html event.strftime('%S')
