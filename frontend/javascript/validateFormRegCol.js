document.addEventListener("DOMContentLoaded", () => {
    const reg_button = document.querySelector('#reg-button');

    reg_button.addEventListener('click', () => {
        let email = document.getElementById("email_login").value;
        let nome = document.getElementById("reg-name-frm").value;	
        let idade = document.getElementById("idade").value;
        let area = document.getElementById("area").value;
        let crm = document.getElementById("crm").value;		
        let re_email = /^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/;

        if(re_email.test(email)) {
            if(nome == "" || idade == "" || area == "" || crm == ""){
                alert('Campo obrigatório vazio!');
            }
            else{
                document.getElementById("frm").submit();
            }
        }
        else {
            alert('E-mail inválido');
        }
    })
});