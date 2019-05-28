<template>
  <div id="app">
    <p>
      <router-link to="/view">Go to View ALl</router-link>
      <router-link to="/new">Go to New Article</router-link>
    </p>

    <router-view></router-view>
  </div>
</template>

<script>

export default {
  name: 'app'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
