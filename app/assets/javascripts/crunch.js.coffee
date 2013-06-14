$(document).ready ->
  $.ajax(
    url: 'http://localhost:80'
    method: 'get'
    dataType: 'jsonp'
    jsonpCallback: 'callback'
    success: (data) ->
      Morris.Bar(
        element: 'chart'
        data: data
        stacked: false
        xkey: 'title'
        ykeys: ['value']
        labels: ['Funding Round', '$mm']
      )
  )

# setInterval(displayData, 5000)
