let modeButtons = document.querySelectorAll(".mode");

const generateRandomColors = (num) => {
  let arr = [];
  for(let i = 0; i < num; i ++ ){
    arr.push(randomColor());
  }
  return arr;
}