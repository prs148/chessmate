$(function() {
var $boardContainer = document.querySelector('.board-container'); //grabs the div added to the index page -JB
var $table = document.createElement("table"); 

function buildBoard() {

  for (var i = 0; i < 8; i++) {   
      var $tr = document.createElement('tr');
      for (var n = 0; n < 8; n++) {
          var $td = document.createElement('td');
          $td.setAttribute('data-coord', i+','+n) //grabs the row iterator (i) and the cell iterator (n) and uses them for the coords! -JB
          if (i%2 == n%2) {           //every even square is white, odd is black -JB
              $td.className = "white";
          } else {
              $td.className = "black";
          }
          $tr.appendChild($td);
      }
      $table.appendChild($tr);
  }
  $boardContainer.appendChild($table);
}
buildBoard();
});