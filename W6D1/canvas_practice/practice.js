document.addEventListener("DOMContentLoaded", function(){
  let mycanvas = document.getElementById('mycanvas');
  let ctx = mycanvas.getContext('2d');
  ctx.fillStyle = "red";
  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx.fill();
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 10;
  ctx.stroke();

});
