
const resultado = document.getElementById('resultado');

const formulario = document.querySelector('#cotizar');
 formulario.addEventListener('click',obtener);


//FUNCION PARA OBTENER LA CONVERCION DE LAS MONEDAS
function obtener(e){
    e.preventDefault();
    console.log('click')
    //OBTENER EL VALOR DEL SELECT 1
    const select1 = document.getElementById('moneda');
    const selectSeleccionado1 = select1.options[select1.selectedIndex].value;
      console.log(selectSeleccionado1);

    //OBTENER EL VALOR DEL SELECT 2
    const select2 = document.getElementById('convertido');
    const selectSeleccionado = select2.options[select2.selectedIndex].value;
      

    //OBTENER EL VALOR DEL INPUT DE CANTIDAD
    const input1 = document.getElementById('input1').value;
     
    
    

    fetch('http://localhost/cambioMonedas/post.php')
        .then(res => res.json())
        .then(data=>{
            // console.log(data[2].tarifa)

        let cambio;
            if (selectSeleccionado === 'USD') {
                cambio = `${data[0].tarifa}`;
            }else if (selectSeleccionado === 'EUR') {
                cambio = `${data[1].tarifa}`;
            } else if(selectSeleccionado === 'GBP'){
                cambio = `${data[2].tarifa}`;
            }else if(selectSeleccionado === 'CAD'){
                cambio = `${data[3].tarifa}`;
            }else if(selectSeleccionado === 'JPY'){
                cambio = `${data[4].tarifa}`;
            }else if(selectSeleccionado === 'AUD'){
                cambio = `${data[5].tarifa}`;
            }else if(selectSeleccionado === 'HNL'){
                cambio = `${data[6].tarifa}`;
            }else if(selectSeleccionado === 'ZAR'){
                cambio = `${data[7].tarifa}`;
            }else if(selectSeleccionado === 'ILS'){
                cambio = `${data[8].tarifa}`;
            }else if(selectSeleccionado === 'MXN'){
                cambio = `${data[9].tarifa}`;
            }
    

    const total = (selectSeleccionado1*input1)*(cambio);

    // console.log(total)

    totalTotal = total;

    let templateHTML =`
            <div style="background: #D9534F; height:"30px"; "><br>
            <p style="color: white; font-size:"18px">La Conversion es:${totalTotal} </p>
            </div>
            
            `;

            const aaa = document.querySelector('.contenido-spinner');
            
            aaa.style.display ='block';

         setTimeout(() => {
                // insertar el resultado
               document.querySelector('#resultado').innerHTML = templateHTML;

               // ocultar el spinner
               aaa.style.display ='none';
         }, 3000);
        })

        
}










