$(document).ready ->
  $.ajax(
    url: '/morris.json'
    method: 'get'
    dataType: 'json'
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
