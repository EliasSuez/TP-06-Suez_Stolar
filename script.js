const OPTIONS_CANT = 7; // Del 0 al 6
const ROTATION_INTENSITY = 10; // 1 = 1 vuelta
const ROTATION = ROTATION_INTENSITY * 360;

let container = document.querySelector('.container');
const division = container.querySelectorAll('div');
let btn = document.getElementById('spin');
let i = 1;

btn.onclick = function () {
   let number = getNumber();
   container.style.rotate = number[1] + ROTATION * i + 'deg';
   console.log(number[0]);
   // setTimeout(() => {
   //    container.style.rotate = 0 + 'deg';
   // }, 6000);
   // division[number[0] - 1].style.backgroundColor = 'blue';
   console.log(division);
   i++;
};

function getNumber() {
   n = Math.ceil(Math.random() * OPTIONS_CANT) - 1;
   if (n <= 0) n = 0;
   let r = (365 / OPTIONS_CANT) * n;
   // if (n === 5) r =
   // n = OPTIONS_CANT - 1 - n;
   // if (n == 7) n = 0;
   return [n, r];
}
