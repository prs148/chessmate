$(document).on('turbolinks:load', function() {
  var $boardContainer = document.querySelector('.board-container'); //grabs the div added to the index page -JB

  function genCoords() {
    var coords = [];
    for (var x = 0; x < 8; x++) {    
        for (var y = 0; y < 8; y++) {
            coords.push({x, y, className: x%2 == y%2 ? 'black':'white'})
        }
    }
    return coords
  }

  function updateCoords() {
    var coords = genCoords();
    return coords.map(function(coord){ 
      let color = '';
      color = coord.x < 2 ? 'white' : 'black';
      if (coord.x === 0 || coord.x === 7) {
        if (coord.y === 0 || coord.y === 7) {
          coord.piece = `rook-${color}`;
        } else if (coord.y === 1 || coord.y === 6) {
          coord.piece = `knight-${color}`;
        } else if (coord.y === 2 || coord.y === 5) {
          coord.piece = `bishop-${color}`;
        } else if (coord.y === 3) {
          coord.piece = `queen-${color}`;
        } else if (coord.y === 4) {
          coord.piece = `king-${color}`
        }
      }
      if (coord.x === 1 || coord.x === 6) { //All pawns populate a single row on both sides, no y coord needed
          coord.piece = `pawn-${color}`;
        }
      return coord;
    });
  }

 function buildBoard() {
  var coords = updateCoords();
  var $table = document.createElement("table"); 
  $boardContainer.appendChild($table);

  var buildTrTd = function(coord){

    var $td = document.createElement('td'); 
    $td.className = coord.className;
    $td.setAttribute('data-x', coord.x);
    $td.setAttribute('data-y', coord.y);
    $td.setAttribute('piece', coord.piece);
    $tr.appendChild($td)    
  }

  for (var x = 0; x < 8; x++) { 
    var $tr = document.createElement('tr');
    if (x === 0) {
      coords.slice(0, 8).forEach(buildTrTd);
      $table.appendChild($tr);
    } else {
      coords.slice((x * 8) , (x +1) * 8).forEach(buildTrTd)
      $table.appendChild($tr);
    }
  }  
}

buildBoard();
});
