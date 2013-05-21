var button = document.getElementById('button');
var container = document.getElementById('container');

button.onclick = function () {
  var svg = d3.select('div#container svg');

  $.ajax({
    url: '/d3.js'
    method: 'get'
    dataType: 'json'
    success: function(data){
      data = data
    }
  })
}

