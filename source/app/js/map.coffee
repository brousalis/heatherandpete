initializeMap = ->
  latlng = [
    {
      name: 'Hampton Inn & Suites Munster'
      address: '8936 Calumet Avenue<br>Munster, IN 46321'
      number: '(219) 836-5555'
      position: new (google.maps.LatLng)(41.550715586802504, -87.51056134700775)
      info: 'https://www.google.com/maps/place/Hampton+Inn+%26+Suites+Munster/@41.5507199,-87.5107706,17z/data=!4m6!1m3!3m2!1s0x8811e04336432497:0x4fc8741888904b81!2sHampton+Inn+%26+Suites+Munster!3m1!1s0x8811e04336432497:0x4fc8741888904b81'
    },
    {
      name: 'Saint Demetrios Greek Orthodox Church'
      address: '7021 Hohman Avenue<br>Hammond, IN 46324'
      position: new (google.maps.LatLng)(41.58570833819602, -87.52183198928833)
      number: '(219) 932-7347'
      info: 'https://www.google.com/maps/place/St+Demetrios+Greek+Orthodox/@41.585882,-87.5210036,17z/data=!3m1!4b1!4m2!3m1!1s0x8811dfe83f67fbad:0xa9e385faca949ce0'
    },
    {
      name: 'Dynasty Banquets and Ramada Hammond Hotel'
      address: '4125 Calumet Avenue<br>Hammond, IN 46320'
      number: '(219) 933-0500'
      position: new (google.maps.LatLng)(41.63831389532474, -87.50799179077148)
      info: 'https://plus.google.com/104015846739681569073/about?hl=en-US?socpid=238&socfid=maps_api_v3:smartmapsiw'
    }
    {
      name: 'test'
      position: new (google.maps.LatLng)(41.67831389532474, -87.50799179077148)
      hidden: true
    }
  ]

  # map
  map = new (google.maps.Map)(document.getElementById('map-canvas'),
    center: new (google.maps.LatLng)(41.518369, -87.490893)
    draggable: if $(document).width() > 480 then true else false
    scrollwheel: false
    mapTypeId: 'roadmap'
    zoom: 14
  )

  # markers
  $.each latlng, (k,v) ->
    infoWindow = new (google.maps.InfoWindow)

    return if v.hidden
    marker = new (google.maps.Marker)(
      map: map
      position: v.position
    )

    bindInfoWindow marker, map, infoWindow, template(v)

    infoWindow.setContent template(v)
    infoWindow.open map, marker

  # center map
  latlngbounds = new (google.maps.LatLngBounds)

  $.each latlng, (k,v) ->
    latlngbounds.extend v.position

  map.setCenter latlngbounds.getCenter()
  map.fitBounds latlngbounds


template = (obj) ->
  "<div class='name'><strong>"+obj.name+"</strong></div>" +
  "<div class='address'>"+obj.address+"</div>" +
  "<a href='"+obj.info+"'>google map</a>"


bindInfoWindow = (marker, map, infoWindow, html) ->
  google.maps.event.addListener marker, 'click', ->
    infoWindow.setContent html
    infoWindow.open map, marker


initializeMap()
