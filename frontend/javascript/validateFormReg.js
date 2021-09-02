document.addEventListener("DOMContentLoaded", () => {
    const reg_button = document.querySelector('#reg-button');

    reg_button.addEventListener('click', () => {
        let email = document.getElementById("email_login").value;
        let nome = document.getElementById("reg-name-frm").value;	
        let senha = document.getElementById("senha-reg").value;
        let senha_conf = document.getElementById("senha2-reg").value;		
        let re_email = /^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/;

        if(re_email.test(email)) {
            if(nome == "" ){
                alert('Digite seu nome');
            }
            else{
                if(senha == "" || senha !== senha_conf){
                    alert('Senhas não conicidem ou senha nula');
                }
                else{
                    document.getElementById("frm").submit();
                }  
            }
        }
        else {
            alert('E-mail inválido');
        }
    })
});