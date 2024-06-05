function validarFormatoCoordenadas(coordenadas) {
    const regex = /^\(\d{1,4},\d{1,4}\)$/; 
    return regex.test(coordenadas);
}

function validarCoordenadas(coordenadas) {
    const [latitud, longitud] = coordenadas.slice(1, -1).split(',');
    return (
        latitud >= -90 && latitud <= 90 &&
        longitud >= -180 && longitud <= 180
    );
}

function mostrarResultado(valido) {
    const resultadoDiv = document.getElementById('resultado');
    const checkboxCampo = document.getElementById('campo');

    if (valido) {
        resultadoDiv.textContent = 'Cadena validada.';
        checkboxCampo.checked = true; 
    } else {
        resultadoDiv.textContent = 'Cadena NO validada.';
        checkboxCampo.checked = false; 
    }

   
}

function EnvioFormulario(event) {
    event.preventDefault(); 

    const inputCoordenadas = document.getElementById('coordenadas');
    const coordenadas = inputCoordenadas.value;

    const esValido = validarFormatoCoordenadas(coordenadas) &&
                     validarCoordenadas(coordenadas);

    mostrarResultado(esValido);
}



document.getElementById('formulario1').addEventListener('submit', EnvioFormulario);
