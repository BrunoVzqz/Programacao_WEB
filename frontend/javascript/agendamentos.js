const usuarioFalso = {
  tipo: "Administrador"
}
const dadosFalsos = [
  {
    id: 1,
    situacao: "Aberto",
    exame: {
      nome: "teste 1",
      descricao: "exame para teste n1"
    },
    profissional_da_saude: {
      usuario: {
        nome: "Nome Médico",
      }
    },
    paciente: {
      usuario: {
        nome: "Nome Paciente",
      } 
    },
    data: "2022-01-01"
  },
  {
    id: 2,
    situacao: "Cancelado",
    exame: {
      nome: "teste 2",
      descricao: "exame para teste n2"
    },
    profissional_da_saude: {
      usuario: {
        nome: "Nome Médico 2",
      }
    },
    paciente: {
      usuario: {
        nome: "Nome Paciente 2",
      } 
    },
    data: "2022-02-02"
  },
  {
    id: 3,
    situacao: "Concluido",
    exame: {
      nome: "teste 3",
      descricao: "exame para teste n3"
    },
    profissional_da_saude: {
      usuario: {
        nome: "Nome Médico 3",
      }
    },
    paciente: {
      usuario: {
        nome: "Nome Paciente 3",
      } 
    },
    data: "2022-03-03"
  }
];

function templateAgendamentos(agendamento) {
  return `
  <div id="agendamento-${agendamento.id}">
  <h2>${agendamento.exame.nome} <span>(${agendamento.exame.descricao})</span></h2>
  <h3>Situacao: ${agendamento.situacao}</h3>
  <h3>Paciente: ${agendamento.paciente.usuario.nome}</h3>
  <h3>Profissional da Saude: ${agendamento.profissional_da_saude.usuario.nome}</h3>
  <p><strong>Data: </strong>${agendamento.data}</p>
  
  </div>
  `
}

document.getElementById("agendamentos").innerHTML = `
<h1>Agendamentos (${dadosFalsos.length} resultados)</h1>
${dadosFalsos.map(templateAgendamentos).join("")}
`;


let dropdown = document.getElementById('agendamento-dropdown');

let defaultOption = document.createElement('option');
defaultOption.text = 'Selecione um agendamento';

dropdown.add(defaultOption);
dropdown.selectedIndex = 0;
let option;
for (let i = 0; i < dadosFalsos.length; i++) {
  option = document.createElement('option');
  option.text = dadosFalsos[i].exame.nome;
  option.value = dadosFalsos[i].id;
  dropdown.add(option);
}

function edicao() {
  if(usuarioFalso.tipo === "ProfissionalDaSaude" || usuarioFalso.tipo === "Administrador") {

    document.getElementById("alterar-situacao").innerHTML = `
          <option value="A Confirmar">A Confirmar</option>
          <option value="Aberto">Aberto</option>
          <option value="Concluido">Concluído</option>
          <option value="Cancelado">Cancelado</option>
    `
    document.getElementById("editar-data"). innerHTML = `
    <input type="datetime-local" id="alterar-data"/>
    <input type="submit" value="Enviar" onclick="editarAgendamento(false)"></input>
    `
  }
  else {
    document.getElementById("alterar-situacao").innerHTML = `
          <option value="Cancelado">Cancelado</option>
    `
  }
}

edicao()

function editarAgendamento(alteraSitucao) {
  let agendamento_id = document.getElementById('agendamento-dropdown').value;
  let params = {
    id: agendamento_id,
  }
  if(alteraSitucao) {    
    params.situacao = document.getElementById("alterar-situacao").value;
  } else {
    params.data = document.getElementById("alterar-data").value;
  }
  //enviar rota
  console.log(params);
}
