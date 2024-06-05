//Se ejecutará el metodo cuando la página web haya terminado de cargar 
window.addEventListener("load", ejercicioFormulario);


function ejercicioFormulario() {




    validarCookies();
    document.getElementById("nombre").addEventListener("blur", validarForm);
    document.getElementById("apellidos").addEventListener("blur", validarForm);
    document.getElementById("enviar").addEventListener("click", validar, false);
    // FUNCION DE VALIDACION

    function validar(evento) {

        document.getElementById("errores").innerHTML = "";

        // Validamos cada uno de los apartados con llamadas a sus funciones correspondientes.
        if (
            validarNombre("nombre") &&
            validarNombre("apellidos") &&
            validarEdad("edad") &&
            validarNif("nif") &&
            validarEmail("email") &&
            validarProvincia("provincia") &&
            validarFecha("fecha") &&
            validarTelefono("telefono") &&
            validarHora("hora") &&
            confirm("¿Deseas enviar el formulario?")
        )
            return true;
        else {
            // validar envio 
            // Cancelamos el evento de envío por defecto asignado al boton de submit enviar.
            evento.preventDefault();
            return false; // Salimos de la función devolviendo false.
        }

    }

    // FUNCIONES DEL SCRIPT

    function error(campo) {
        document.getElementById("errores").innerHTML = campo + " Incorrecto : " + leerCampo(campo);
        document.getElementById(campo).className = "error";
        document.getElementById(campo).focus();
    }

    function leerCookie(clave) {
        var name = clave + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1);
            if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
        }
        return false;
    }

    function leerCampo(campo) {
        var dato = document.getElementById(campo).value;
        return dato;
    }

    function validarCookies() {

        var CookieEnvio = 1;
        if (leerCookie("envios")) {
            CookieEnvio = leerCookie("envios");
            CookieEnvio = parseInt(CookieEnvio) + 1;
        }

        document.cookie = "envios=" + CookieEnvio;
        document.getElementById("intentos").innerHTML = "Cookies intentos: " + leerCookie("envios");

    }

    function validarForm() {

        document.getElementById("errores").innerHTML = "";

        var nombre = leerCampo("nombre");
        var apellidos = leerCampo("apellidos");

        document.getElementById("nombre").value = nombre.toUpperCase();
        document.getElementById("apellidos").value = apellidos.toUpperCase();
        validarNombre("nombre");
        validarNombre("apellidos");

    }
    //Validaciones el contenido de los campos del formulario 
    function validarNombre(campo) {
        var texto = leerCampo(campo);
        var patron = /^([a-z A-Z])+$/;
        /* comienzo letras espacio mayusculas fin*/

        if (texto.length > 0 && patron.test(texto)) {
            document.getElementById(campo).className = "";
            return true;
        }
        else {
            error(campo);
            return false;
        }
    }
    //Validaciones el contenido de los campos del formulario 

    function validarEdad(campo) {
        var texto = leerCampo(campo);
        var patron = /^(\d{1,3})$/;
        /* comienzo  de 1 a 3 número fin*/
        if (texto.length > 0 && texto > 0 && texto <= 105 && patron.test(texto)) {
            document.getElementById(campo).className = "";
            return true;
        }
        else {
            error(campo);
            return false;
        }
    }
    //Validaciones el contenido de los campos del formulario 

    function validarNif(campo) {
        var texto = leerCampo(campo);
        var patron = /^\d{8}[a-zA-Z]$/;
        /* comienzo  8 número seguido de una letra fin insensitive*/
        if (!(patron.test(texto))) {
            error(campo);
            return false;
        }
        else {
            document.getElementById(campo).className = "";
            return true;
        }

    }
    //Validaciones el contenido de los campos del formulario 

    function validarEmail(campo) {
        var texto = leerCampo(campo);
        var patron = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        /* comienzo  letras, dígitos y subrayados seguido de @ (dígitos IPS) o (letras, digitos y subrayados) . y (mas de 2 letras) fin*/
        if (!(patron.test(texto))) {
            error(campo);
            return false;
        }
        else {
            document.getElementById(campo).className = "";
            return true;
        }

    }
    //Validaciones el contenido de los campos del formulario 

    function validarProvincia(campo) {
        var texto = leerCampo(campo);
        if (texto == 0 || texto.length == 0) {
            error(campo);
            return false;
        }
        else {
            document.getElementById(campo).className = "";
            return true;
        }

    }
    //Validaciones el contenido de los campos del formulario 

    function validarFecha(campo) {
        var texto = leerCampo(campo);
        var patron = /^(\d{2}(\/|-)\d{2}(\/|-)\d{4})$/;
        /* comienzo 2 digitos /o- 2 digitos /o- 4 digitos y fin*/
        if (!(patron.test(texto))) {
            error(campo);
            return false;
        }
        else {
            document.getElementById(campo).className = "";
            return true;
        }

    }
    //Validaciones el contenido de los campos del formulario 

    function validarTelefono(campo) {
        var texto = leerCampo(campo);
        var patron = /^\d{9}$/;
        if (!(patron.test(texto))) {
            error(campo);
            return false;
        }
        else {
            document.getElementById(campo).className = "";
            return true;
        }

    }
    //Validaciones el contenido de los campos del formulario 

    function validarHora(campo) {
        var texto = leerCampo(campo);
        var patron = /^\d{2}\:\d{2}$/;
        if (!(patron.test(texto))) {
            error(campo);
            return false;
        }
        else {
            document.getElementById(campo).className = "";
            return true;
        }

    }




}