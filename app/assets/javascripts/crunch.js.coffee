$(document).ready ->

  displayData = ->
    $.ajax(
      url: '/morrison.json'
      method: 'get'
      dataType: 'json'
      succes: (data) ->
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
