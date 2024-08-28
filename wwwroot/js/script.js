const OPTIONS_CANT = 7; // Del 0 al 6
const ROTATION_INTENSITY = 10; // 1 = 1 vuelta
const ROTATION = ROTATION_INTENSITY * 360;

const wheel = document.querySelector('.wheel');
const division = wheel.querySelectorAll('div');
const btn = document.getElementById('spin');
const main = document.querySelector('main');
const form = main.querySelector('form');
const wc = document.querySelector('.wheel-container');
const spin = document.querySelector('.spin');

const rtas = document.querySelectorAll('input[name="idRespuesta"]');

let i = 1;

console.log(CAT);
btn.onclick = function () {
   let v = -parseInt((CAT - 1) * (360 / OPTIONS_CANT) + ROTATION) + 'deg';
   console.log(v);
   wheel.style.rotate = v;
   setTimeout(() => {
      wc.style.display = 'none';
      spin.style.display = 'none';
      form.style.display = 'flex';
      console.log(rtas);
   }, 5000);
   setTimeout(() => {
      container.style.rotate = 0 + 'deg';
   }, 6000);
   console.log(division);
   i++;
};
console.log(form.action);

rtas.forEach((rta) => {
   rta.addEventListener('click', () => {
      form.submit();
   });
});
