/*Players will be X and O. x = 1 and o = -1. 
This way, we can take the absolute value of 3 positions and
check to see it equals 3. Any other combination besides 3 of either
X or O will not equal 3, making it a safe way to determine a winner.
*/

var turn = 1;
var board = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
      ];

var game_finished = false;

function check_all() {
  check_rows();
  check_columns();
  check_diag();
}

function check_rows() {
  if (game_finished === false) {
    var length = board.length;
    for(r=0; r<length; r++)
      if (Math.abs(board[r][0] + board[r][1] + board[r][2]) === 3) {
        game_over();
      }
  }
}

function check_columns() {
  if (game_finished === false) {
    var length = board.length;
    for(c=0; c<length; c++)
      if (Math.abs(board[0][c] + board[1][c] + board[2][c]) === 3) {
        game_over();
      }
  }
}

function check_diag() {
  if (game_finished === false) {
    var length = board.length;
    if (Math.abs(board[0][0] + board[1][1] + board[2][2]) === 3) {
      game_over();
    }
    if (Math.abs(board[0][2] + board[1][1] + board[2][0]) === 3) {
      game_over();
    }
  }
}

function box_click() {
  var box_id = $(this).attr('id'); //Ex. id='box_0_0'

  row = parseInt(box_id.slice(4, 5));
  column = parseInt(box_id.slice(6, 7));

  if (turn % 2 === 0) {
    board[row][column] = 1;
    $(this).addClass('positive');
  }
  else {
    board[row][column] = -1;
    $(this).addClass('negative');
  }
  turn ++;
  check_all();
  if (turn === 10) {
    alert('Nobody won! How typical!');
  }
}

function game_over() {
  alert("You've won! The game is over!");
  game_finished = true;
}


$(document).ready(function() {
  $('.block').click(box_click);
});





