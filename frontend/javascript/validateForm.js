document.addEventListener("DOMContentLoaded", () => {
    const button = document.querySelector('#login-button');

    button.addEventListener('click', () => {
        let email = document.getElementById("email_login").value;
        let senha = document.getElementById("senha_login").value;	
        let re_email = /^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/;

        if(re_email.test(email)) {
            if(senha == ""){
                alert('Digite a senha');
            }
            document.getElementById("frm").submit();
        }
        else {
            alert('E-mail inválido');
        }
    })
});


