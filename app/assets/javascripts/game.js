$(document).on('turbolinks:load', function() {

var $boardContainer = document.querySelector('.board-container'); //grabs the div added to the index page -JB
var $table = document.createElement("table"); 
var $piecesContainer = document.querySelector('.pieces-container');


getID(); 

function getID() {
  let gameID = location.pathname.split('/')[2];
  getGamePieces(gameID);
}



function getGamePieces(id) {
     $.ajax({
        url: `/get_pieces/${id}`,
        method: 'get',

     }).then(function (data) {
       let $pieces = data; 
       $piecesContainer.append($pieces);
       console.log ($pieces);

     })
      

}        


function buildBoard() {



  for (var x = 0; x < 8; x++) {   
      var $tr = document.createElement('tr');
      for (var y = 0; y < 8; y++) {
          var $td = document.createElement('td');
          $td.setAttribute('data-x', x)
          $td.setAttribute('data-y', y) //grabs the row iterator (i) and the cell iterator (n) and uses them for the coords! -JB
          if (x%2 == y%2) {           //every even square is white, odd is black -JB
              $td.className = "black";
          } else {
              $td.className = "white";
          }
          $tr.appendChild($td);
           
          $td.addEventListener('click', handleGetCoord);
            
      }
      $table.appendChild($tr);
  }
  $boardContainer.appendChild($table);


  }

buildBoard()
});




function handleGetCoord(event) {
     var $td = event.target; 
     var coordx =  $td.getAttribute('data-x');
     var coordy = $td.getAttribute('data-y');
     console.log(coordx, coordy);

}

