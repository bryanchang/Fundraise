# button = document.getElementById('button')
container = document.getElementById('container')

# $('#button').on 'click' ->
$(document).ready ->
  $('button').on 'click', ->
    $.ajax
      url: '/d3.json'
      method: 'get'
      dataType: 'json'
      success: (data) ->
        svg = d3.select('div#container svg')
        data = data
        svg.selectAll("rect")
          .data(data)
          .enter()
          .append("rect")
          .attr("height", 30)
          .attr("width", 0)
          .style('fill', '#3B5998')
          .transition()
          .duration(2000)
          .attr("width", (value) -> value * 0.5)
          .attr("y", (value, i)-> i * 40)

