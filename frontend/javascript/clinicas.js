const usuarioFalso = {
  tipo: "Administrador"
}
const dadosFalsos = [
  {
    id: 1,
    nome: "Clinica 1",
    endereco: "municipio x, bairro y ...",
    telefone: "(48)999999999",
    profissionais_da_saude: [{
      usuario: {
        nome: "Medico 1"
      },
      agendamentos: []
    }, {
      usuario: {
        nome: "Medico 2"
      },
      agendamentos: []
    }
  ]
  },
  {
    id: 2,
    nome: "Clinica 2",
    endereco: "municipio x, bairro z ...",
    telefone: "(48)999999998",
    profissionais_da_saude: [{
      usuario: {
        nome: "Medico 3"
      },
      agendamentos: []
    }, {
      usuario: {
        nome: "Medico 4"
      },
      agendamentos: []
    }
  ]
  },
  {
    id: 1,
    nome: "Clinica 3",
    endereco: "municipio x, bairro A ...",
    telefone: "(48)999999997",
    profissionais_da_saude: [{
      usuario: {
        nome: "Medico 5"
      },
      agendamentos: []
    }, {
      usuario: {
        nome: "Medico 6"
      },
      agendamentos: []
    }
  ]
  },
];

function profissionais(profissionais) {
  return `
<h4>Profissionais da Saúde</h4>
<ul class="list-medicos">
${profissionais.map(profissional => `<li>${profissional.usuario.nome}</li>`).join("")}
</ul>
`;
}

function templateClinicas(clinica) {
  return `
  <div id="clinica-${clinica.id}">
  <h2>${clinica.nome} <span>(${clinica.telefone})</span></h2>
  <h3>Endereco: ${clinica.endereco}</h3>
  ${clinica.profissionais_da_saude ? profissionais(clinica.profissionais_da_saude) : ""}
  </div>
  `
}

document.getElementById("clinicas").innerHTML = `
<h1>Clínicas (${dadosFalsos.length} resultados)</h1>
${dadosFalsos.map(templateClinicas).join("")}
`;

function modalClinica() {
  if(usuarioFalso.tipo === "Administrador") {
    document.getElementById("botao-clinica-criar").innerHTML = `
    <button id="botao-criacao">Criar Clínica</button>
    `;

    document.getElementById("modal-clinica-criar").innerHTML = `
    <div id="modal-criacao" class="modal">
    
      <div class="modal-content">
        <span class="close">&times;</span>
        <input id="nome-criacao" type="text"></input>
        <input id="endereco-criacao" type="text"></input>
        <input id="telefone-criacao" type="text"></input>
        <input type="submit" value="Enviar" onclick="criarClinica()"></input>
      </div>
    </div>
    `;
    document.getElementById("botao-clinica-editar").innerHTML = `
    <button id="botao-edicao">Editar Clínica</button>
    `;

    document.getElementById("modal-clinica-editar").innerHTML = `
    <div id="modal-edicao" class="modal">
    
      <div class="modal-content">
        <span class="close">&times;</span>
        <select id="clinica-dropdown" name="Clínica"></select>
        <input id="nome-edicao" type="text"></input>
        <input id="endereco-edicao" type="text"></input>
        <input id="telefone-edicao" type="text"></input>
        <input type="submit" value="Enviar" onclick="editarClinica()"></input>
      </div>
    </div>
    `;
  }
  dropdownClinica();
}

modalClinica();

//modais
var modalCriacao = document.getElementById("modal-clinica-criar");
modalCriacao.style.display = "none";
var btnCriacao = document.getElementById("botao-criacao");
var spanCriacao = document.getElementsByClassName("close")[0];
btnCriacao.onclick = function() {
  modalCriacao.style.display = "block";
}
spanCriacao.onclick = function() {
  modalCriacao.style.display = "none";
}
window.onclick = function(event) {
  if (event.target == modalCriacao) {
    modalCriacao.style.display = "none";
  }
}

var modalEdicao = document.getElementById("modal-clinica-editar");
modalEdicao.style.display = "none";
var btnEdicao = document.getElementById("botao-edicao");
var spanEdicao = document.getElementsByClassName("close")[1];
btnEdicao.onclick = function() {
  modalEdicao.style.display = "block";
}
spanEdicao.onclick = function() {
  modalEdicao.style.display = "none";
}
window.onclick = function(event) {
  if (event.target == modalEdicao) {
    modalEdicao.style.display = "none";
  }
} 

function criarClinica() {
  let params = {};
  params.nome = document.getElementById('nome-criacao').value;
  params.endereco = document.getElementById('endereco-criacao').value;
  params.telefone = document.getElementById('telefone-criacao').value;
  
  //enviar rota
  console.log(params);
}

function editarClinica() {
  let params = {}
  let clinica_id = document.getElementById('clinica-dropdown').value;
  params.id = clinica_id

  params.nome = document.getElementById('nome-edicao').value;
  params.endereco = document.getElementById('endereco-edicao').value;
  params.telefone = document.getElementById('telefone-edicao').value;
  
  //enviar rota
  console.log(params);
}


function dropdownClinica() {
  let dropdown = document.getElementById('clinica-dropdown');

  let defaultOption = document.createElement('option');
  defaultOption.text = 'Selecione uma Clínica';

  dropdown.add(defaultOption);
  dropdown.selectedIndex = 0;
  let option;
  for (let i = 0; i < dadosFalsos.length; i++) {
    option = document.createElement('option');
    option.text = dadosFalsos[i].nome;
    option.value = dadosFalsos[i].id;
    dropdown.add(option);
  }
}