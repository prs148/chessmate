$(document).on('turbolinks:load', function() {
  var $boardContainer = document.querySelector('.board-container'); //grabs the div added to the index page -JB

  function genCoords() {
    var coords = [];
    for (var y = 0; y <= 7; y++) {    
        for (var x = 0; x < 8; x++) {
            coords.push(
              {
                y, 
                x, 
                className: y%2 == x%2 ? 'black':'white'
              })
        }
        
    }
    console.log(coords)
    return coords
  }

  function updateCoords() {
    var coords = genCoords();
    return coords.map(function(coord){ 
      let color = '';
      color = coord.y < 2 ? 'white' : 'black';
      if (coord.y === 0 || coord.y === 7) {
        if (coord.x === 0 || coord.x === 7) {
          coord.piece = `rook-${color}`;
        } else if (coord.x === 1 || coord.x === 6) {
          coord.piece = `knight-${color}`;
        } else if (coord.x === 2 || coord.x === 5) {
          coord.piece = `bishop-${color}`;
        } else if (coord.x === 3) {
          coord.piece = `queen-${color}`;
        } else if (coord.x === 4) {
          coord.piece = `king-${color}`
        }
      }
      if (coord.y === 1 || coord.y === 6) { //All pawns populate a single row on both sides, no x coord needed
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
    $td.setAttribute('data-y', coord.y);
    $td.setAttribute('data-x', coord.x);
    $td.setAttribute('piece', coord.piece);
    // $td.innerHTML= 'cord.piece';
    $tr.appendChild($td);    
  }

  for (var y = 0; y <= 7; y++) { 
    var $tr = document.createElement('tr');
    if (y === 0) {
      coords.slice(0, 8).forEach(buildTrTd);
      $table.appendChild($tr);
    } else {
      coords.slice((y * 8) , (y +1) * 8).forEach(buildTrTd)
      $table.appendChild($tr);
    }
  }  
}

buildBoard();
});
