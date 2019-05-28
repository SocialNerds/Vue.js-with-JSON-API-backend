<template>
  <div>
    <h1>Articles</h1>
    <div :for="article in articles" :key="`${article.title}-${article.user}`">
      <h2>{{ article.title }}</h2> <h6 style="display: inline-block;">{{ article.user }}</h6>

      <p>{{ article.content }}</p>
    </div>
    
    <p :if="error !== ''" style="color: red;">{{ error }}</p>

    <p :if="loading">Loading...</p>
    <a :if="!loading" @click="loadMore()">Load More</a>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'ViewAll',
  data () {
    return {
      articles: [],
      error: '',
      loading: false,
      page: 0
    }
  },
  async mounted () {
    await this.loadMore()
  },
  methods: {
    async loadMore(){
      this.loading = true
      this.error = ''
      try {
        const response = axios.get(`http://localhost/getAll?page=${this.page}`)

        this.articles.push(response.articles)
        this.page = response.nextPage
      } catch (e) {
        this.error = e
      }

      this.loading = false
    }
  }
}
</script>

<style scoped>
</style>
