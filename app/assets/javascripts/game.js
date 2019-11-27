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
      if (coord.x === 0 && coord.y === 0 || coord.x === 0 && coord.y === 7) {
        coord.piece = `rook-${coord.x>2 ? 'black' : 'white'}`;
      } else if (coord.x === 0 && coord.y === 1 || coord.x === 0 && coord.y === 6) {
        coord.piece = `knight-${coord.x>2 ? 'black' : 'white'}`;
      } else if (coord.x === 0 && coord.y === 2 || coord.x === 0 && coord.y === 5) {
        coord.piece = `bishop-${+ coord.x>2 ? 'black' : 'white'}`;
      } 
      return coord;
    });
  }

 function buildBoard() {
    var coords = updateCoords();
    var $table = document.createElement("table"); 
    var $tr = document.createElement('tr');
    var $td = document.createElement('td');
    $boardContainer.appendChild($table);
    for (var x = 0; x < 8; x++) { 
        $table.appendChild($tr);
      }
    coords.forEach(function(coord){

    })
    // for (var y = 0; y < 8; y++) {
        var $td = document.createElement('td');

        coords.push({x, y}) //adding the coordinates to coords array
        
        }
        
    }
    
  }


  

  buildBoard();

  // console.log(buildCoords());

});
//   function appendPiece(x, y) {
//     if (x === 1 || x === 6){
//       pawn = Pawn.new(x, y, white)

//     }
// }