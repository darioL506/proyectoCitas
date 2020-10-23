function validacion()
{
    
    const form = document.getElementsByTagName('form')[0];

    const email = document.getElementById('email');
    const emailError = document.querySelector('#email + span.errorMail');
    
    const paswword = document.getElementById('paswword');
    const paswwordError = document.querySelector('#paswword + span.errorPass');

    form.addEventListener('submit', function (event) {

        if (!email.validity.valid) {
            showError();
            event.preventDefault();
        }
        
        if (!paswword.validity.valid) {
            showError();
            event.preventDefault();
        }
    });

    function showError() {
        
        if (email.validity.valueMissing) {
            emailError.textContent = 'Debe introducir una dirección de correo electrónico.';
        } else if (email.validity.typeMismatch) {
            emailError.textContent = 'El valor introducido debe ser una dirección de correo electrónico.';
        }
        
        if (paswword.validity.valueMissing) {
            paswwordError.textContent = 'Debe introducir una contraseña';
        } else if (email.validity.patternMismatch) {            
            paswwordError.textContent = 'La contraseña debe incluir minimo una mayuscula, una minuscula y un número';
        } else if (email.validity.tooShort) {
            paswwordError.textContent = 'La cotraseña debe tener al menos ${ email.minLength } caracteres; ha introducido ${ email.value.length }.';
        }
        emailError.className = 'error active';
        paswwordError.className = 'error active';
    }
}


