$(document).on('turbolinks:load', function() {
var $boardContainer = document.querySelector('.board-container'); //grabs the div added to the index page -JB
var $table = document.createElement("table"); 

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
      }
      $table.appendChild($tr);
  }
  $boardContainer.appendChild($table);
}
buildBoard();
});