function mudarTexto(){
    if(screen.width < 450){    
        document.querySelector('#reg-title').innerHTML = 'Use sua conta para acessar' + '<br/>' + 'suas consultas!'
        document.querySelector('.name-app-header').innerText = 'CADASTRO'
    }
    else{
        document.querySelector('#reg-title').innerText = 'Crie sua conta'
        document.querySelector('.name-app-header').innerText = 'Consulta Fácil'
    };
};

window.addEventListener('resize', function(){ mudarTexto() })

window.addEventListener("DOMContentLoaded", function(){ mudarTexto() });
