$(function() {
var $boardContainer = document.querySelector('.board-container');
var $table = document.createElement("table");

function buildBoard() {

  for (var i = 0; i < 8; i++) {
      var $tr = document.createElement('tr');
      for (var n = 0; n < 8; n++) {
          var $td = document.createElement('td');
          $td.setAttribute('data-coord', i+','+n)
          if (i%2 == n%2) {
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