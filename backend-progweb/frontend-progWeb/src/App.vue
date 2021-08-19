<template>
  <div id="app" class="container">
    <Header/>
    <router-view></router-view>
    <Footer/>
  </div>
</template>
<style>
  .container{
    display: grid;
    color: white;
    grid-template-columns: 470px auto;
    grid-template-rows: 100px auto;
    grid-template-areas: "header header" "aside main";
    height: 100%;
  }
</style>

<script>
import Header from './components/Header.vue'
import Footer from './components/Footer.vue'

export default {
  name: 'App',
  components: {
    Header,
    Footer
  }
}
</script>
