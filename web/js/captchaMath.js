/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function main() {
    captcha();
    //let interval = setInterval(captcha,120000);
}

function captcha() {
    
    var num1 = Math.floor(Math.random() * 9) + 1;
    
    var num2 = Math.floor(Math.random() * 9) + 1;
    
    var aux = Math.floor(Math.random() * 3) + 1;
    
    
    
    var op;
    
    var result = 0;
    
    if(aux === 1) {
        op=num1.toString()+" + "+num2.toString();
        result = num1+num2;
    }
    
    if(aux === 2) {
        if(num1>=num2) {
            op=num1.toString()+" - "+num2.toString();
            result = num1-num2; 
        } else {
            op=num2.toString()+" - "+num1.toString();
            result = num2-num1;
        }        
    }
    
    if(aux === 3) {
        op=num1.toString()+" x "+num2.toString();
        result = num1*num2;
    }
    
    document.cookie = "resultado="+result;
    document.cookie = "code="+op;
    
    creaIMG(op);
}

function leerCookies(nombre) {
    
    var lista = document.cookie.split(";");
    
    for (i in lista) {
        var busca = lista[i].search(nombre);
        if (busca > -1) {micookie=lista[i]}
    }
    
    var igual = micookie.indexOf("=");
    var valor = micookie.substring(igual+1);
    
    return valor;
}

function validCaptcha(txtInput) {
    var aux = document.getElementById(txtInput).value;
    alert(aux);
    var string1 = leerCookies("result");
    var string2 = removeSpaces(aux);
   
    if (string1 === string2) {
        alert("entra "+string1+" "+string2);
        document.getElementById("submit").disabled= false;
    }
    
}
function removeSpaces(string) {
    return string.split(' ').join('');
}

function creaIMG(texto) {    
    var ctxCanvas = document.getElementById('captcha').getContext('2d');
    var fontSize = "30px";
    var fontFamily = "Arial";
    var width = 100;
    var height = 50;
    //tamaño
    ctxCanvas.canvas.width = width;
    ctxCanvas.canvas.height = height;
    //color de fondo
    ctxCanvas.fillStyle = "whitesmoke";
    ctxCanvas.fillRect(0, 0, width, height);
    //puntos de distorsión
    ctxCanvas.setLineDash([7, 10]);
    ctxCanvas.lineDashOffset = 5;
    ctxCanvas.beginPath();
    var line;
    for (var i = 0; i < (width); i++) {
        line = i * 5;
        ctxCanvas.moveTo(line, 0);
        ctxCanvas.lineTo(0, line);
    }
    ctxCanvas.stroke();
    //formato texto
    ctxCanvas.direction = 'ltr';
    ctxCanvas.font = fontSize + " " + fontFamily;
    //texto posicion
    var x = (width / 9);
    var y = (height / 3) * 2;
    //color del borde del texto
    ctxCanvas.strokeStyle = "yellow";
    ctxCanvas.strokeText(texto, x, y);
    //color del texto
    ctxCanvas.fillStyle = "red";
    ctxCanvas.fillText(texto, x, y);
}
