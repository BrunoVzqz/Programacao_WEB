<template>
  <footer>
      <div class="footer-left-itens">
        <nav>
          <ul class="menu-footer">
            <router-link to="/contato" class="menu-footer-left">Contato</router-link>
            <router-link to="/redes_sociais" class="menu-footer-left">Redes Sociais</router-link>
          </ul>
        </nav>
      </div>
      <div class="footer-right-itens">
        <a>
          <router-link to="/clinicas" class="menu-footer-right">Unidades de Atendimento</router-link>
        </a>
      </div>
  </footer>
</template>
<style>
  a {
    text-decoration: none;
  }
  footer{
    position:absolute;
    bottom:0;
    width:100%;
    bottom: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #47D3DC;
    text-align: center;
    height: 10px;
    padding-top: 20px;
    padding-bottom: 21px;
    margin-top: auto;
    font-size: 18px;
    font-family: Arial, Helvetica, sans-serif;
  }
  .menu-footer{
    display: flex;
    justify-content: space-around;
  }

  .footer-left-itens{
      width: 270px;
  }

  .menu-footer-left{
      color: #FFFF;
  }

  .footer-right-itens{
      height: 30px;
      padding-right: 15px;
      background-color: #47DCD3;
      padding-top: 10px;
      padding-bottom: 10px;
      padding-left: 10px;
  }

  .menu-footer-right{
      height: 30px;
      color: #E5E5E5;
      padding-right: 10px;
  }
</style>

<script>
export default {
  name: 'Footer',
  created () {
    this.signedIn()
  },
  methods: {
    signedIn () {
      return localStorage.signedIn
    }
  }
}
</script>
