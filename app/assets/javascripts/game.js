$(document).on('turbolinks:load', function() {

var $boardContainer = document.querySelector('.board-container'); //grabs the div added to the index page -JB
var $table = document.createElement("table"); 
var $piecesContainer = document.querySelector('.pieces-container');


getID(); 

function getID() {
  let gameID = location.pathname.split('/')[2];
  getGamePieces(gameID);
}

function getAsciiFromType(piece) {
  
  switch (piece.type_id){
    case 1:
      return 'blah';
    break;

  }
}


function getGamePieces(id) {
     $.ajax({
        url: `/get_pieces/${id}`,
        method: 'get',

     }).then(function (data) {
       let pieces = data; 
       // console.log(pieces);
       pieces.forEach(function (piece) {
        var row = $boardContainer.querySelector(`[data-x="${piece.x_position}"][data-y="${piece.y_position}"]`);

       
         if (row){
          var image = document.createElement('img');
          image.setAttribute('src', `./assets/images/pwn_blk.png`); 
          var span = document.createElement('span');
          span.className = 'piece';
          span.setAttribute('draggable', 'true')
          span.setAttribute('ondragstart', 'onDragStart(event);')
          span.setAttribute('id', piece.id);
          span.appendChild(image);
          // span.append(piece.image);
          row.appendChild(span);
         }
       })

     })
      
}        


function buildBoard() {



  for (let y = 0; y < 8; y++) {   
      var $tr = document.createElement('tr');
      for (let x = 0; x < 8; x++) {
          var $td = document.createElement('td');
          $td.setAttribute('data-x', x)
          $td.setAttribute('data-y', y)
          $td.setAttribute('ondragover', 'onDragOver(event);')
          $td.setAttribute('ondrop', 'onDrop(event);') //grabs the row iterator (i) and the cell iterator (n) and uses them for the coords! -JB
          if (x%2 == y%2) {           //every even square is white, odd is black -JB
              $td.className = "black square";
          } else {
              $td.className = "white square";
          }
          $tr.appendChild($td);
           
          $td.addEventListener('click', handleGetCoord);
            
      }
      $table.appendChild($tr);
  }
  $boardContainer.appendChild($table);


  }



buildBoard();


});

function onDragStart(event) {
  event.dataTransfer.setData("text/plain", event.target.id); //this grabs the id attribute that I set for the spans that currently equals piece.id

}

function onDrop(event) {
  console.log(event);
  const display = event
    .dataTransfer
    .getData('text'); //this passes the id that we grabbed above to the new child element that we are 
                      //appending to the new box to make sure the correct piece is moved
  console.log(display);
  const draggableElement = document.getElementById(display);
  const dropzone = event.target;

  dropzone.appendChild(draggableElement);

  event
    .dataTransfer
    .clearData();
}

function onDragOver(event) { //here we can set styling to any of the boxes as the piece is dragged over them, such as highlighting
  event.preventDefault();
}

function handleGetCoord(event) {
     var $td = event.target; 
     var coordx =  $td.getAttribute('data-x');
     var coordy = $td.getAttribute('data-y');
     console.log(coordx, coordy);
}
