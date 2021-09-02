function mudarTexto(){
    if(screen.width < 450){    
        document.querySelector('#login-title').innerHTML = 'Use sua conta para acessar' + '<br/>' + 'suas consultas!'
        document.querySelector('.name-app-header').innerText = 'LOGIN'
    }
    else{
        document.querySelector('#login-title').innerText = 'LOGIN'
        document.querySelector('.name-app-header').innerText = 'Consulta Fácil'
    };
};

window.addEventListener('resize', function(){ mudarTexto() })

window.addEventListener("DOMContentLoaded", function(){ mudarTexto() });
