<template>
  <header class="header-top">
    <div class="header-top-left">
      <span class="name-app-header"> Consulta Fácil </span>
      <img src="logo-ufsc.png">
    </div>
    <nav class="nav-top">
      <ul class="menu">
        <router-link to="/inicio" class="menu-itens menu-itens-left">Início</router-link>
        <router-link to="/atendimento" class="menu-itens menu-itens-left" v-if="signedIn()">Atendimento</router-link>
        <li>
          <a><router-link to="/login" class="link-grey px-2 no-underline" v-if="!signedIn()">Login</router-link></a>
          <a><router-link to="/signup" class="link-grey px-2 no-underline" v-if="!signedIn()">Cadastro</router-link></a>
          <a href="#" @click.prevent="signOut" class="link-grey px-2 no-underline" v-if="signedIn()">Sair</a>
        </li>
      </ul>
    </nav>
  </header>
</template>
<style>
  .header-top {
      grid-area: header;
      display: flex;
      justify-content: space-between;
      padding: 0px 15px 5px 10px;
      align-items: center;
      background-color: #47D3DC;
      font-family: Arial, Helvetica, sans-serif;
  }

  .header-top-left{
      display: flex;
      justify-content: space-between;
      align-items: center;
      height: 50px;
      width: 570px;
  }

  .name-app-header{
      height: 40px;
      font-size: 40px;
  }

  .nav-top{
      width: 600px;
      height: 80px;
  }
</style>

<script>
export default {
  name: 'Header',
  created () {
    this.signedIn()
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    signedIn () {
      return localStorage.signedIn
    },
    signOut () {
      this.$http.secured.delete('/signin')
        .then(response => {
          delete localStorage.csrf
          delete localStorage.signedIn
          this.$router.replace('/')
          this.$router.go()
        })
        .catch(error => this.setError(error, 'Cannot sign out'))
    }
  }
}
</script>
