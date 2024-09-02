const OPTIONS_CANT = 7; // Del 0 al 6
const ROTATION_INTENSITY = 10; // 1 = 1 vuelta
const ROTATION = ROTATION_INTENSITY * 360;

const wheel = document.querySelector('.wheel');
const division = wheel.querySelectorAll('div');
const btn = document.getElementById('spin');
const main = document.querySelector('main');
const form = document.getElementById('respuesta');
const wc = document.querySelector('.wheel-container');
const spin = document.querySelector('.spin');
const sp = document.getElementById('sp');
const rtas = document.querySelectorAll('input[name="idRespuesta"]');
const labels = form.querySelectorAll('label');
let answered = false;
let i = 1;

btn.onclick = function () {
   let v = -parseInt((CAT - 1) * (360 / OPTIONS_CANT) + ROTATION) + 'deg';
   wheel.style.rotate = v;
   setTimeout(() => {
      wc.style.display = 'none';
      spin.style.display = 'none';
      form.style.display = 'flex';
   }, 5000);
   setTimeout(() => {
      container.style.rotate = 0 + 'deg';
   }, 6000);
   i++;
};

rtas.forEach((rta) => {
   rta.addEventListener('click', async () => {
      const data = {
         idPregunta: document.getElementById('idPregunta').value,
         idRespuesta: rta.value
      };
      const action =
         form.action +
         '?idPregunta=' +
         data.idPregunta +
         '&idRespuesta=' +
         data.idRespuesta;
      if (!answered) {
         fetch(action, {
            method: 'GET',
            headers: { 'Content-type': 'application/json; charset=UTF-8' }
         })
            .then((r) => r.json())
            .then((j) => {
               console.log(j);
               labels.forEach((e) => {
                  e.classList.add('wrong');
                  if (parseInt(e.getAttribute('for')) === parseInt(j.rCorrecta))
                     e.classList.add('right');
               });
               sp.classList.remove('d-none');
            });
         answered = true;
      }
   });
});
