const OPTIONS_CANT = 7; // Del 0 al 6
const ROTATION_INTENSITY = 10; // 1 = 1 vuelta
const ROTATION = ROTATION_INTENSITY * 360;

const wheel = document.querySelector('.wheel');
const division = wheel.querySelectorAll('div');
const btn = document.getElementById('spin');
const main = document.querySelector('main');
const form = main.querySelector('form');
const wc = document.querySelector('.wheel-container');
let i = 1;

btn.onclick = function () {
   let number = getNumber();
   wheel.style.rotate = number[1] + ROTATION * i + 'deg';
   console.log(number[0]);
   // setTimeout(() => {
   // container.style.top = '-100px';
   wc.style.display = 'none';
   // btn.style.top =
   //    Number(
   //       getComputedStyle(btn).top.substring(
   //          0,
   //          getComputedStyle(btn).top.length - 2
   //       )
   //    ) -
   //    100 +
   //    'px';
   const h1 = document.createElement('h1');
   h1.textContent = 'Cuantos goles metio gusa en 2020?';
   h1.classList.add('text-white');
   form.appendChild(h1);
   for (var i = 0; i < 4; i++) {
      option = createOption('20');
      form.appendChild(option);
   }
   // }, 5000);
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

function createOption(value) {
   r = document.createElement('button');
   r.type = 'submit';
   r.value = value;
   r.classList.add('button2', 'm-2');
   r.textContent = value;
   r.href = 'https://www.youtube.com';
   r.addEventListener('click', (e) => {
      // e.preventDefault();
      console.log(e.target.href);
      console.log('Gusa');
   });
   return r;
}
