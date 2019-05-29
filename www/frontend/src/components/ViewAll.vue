<template>
  <div>
    <h1>Loaded {{ articles.length }} Articles</h1>

    <div v-for="(article, index) in articles" :key="`article-${index}`">
      <h2>{{ article.title }}</h2> <h6 style="display: inline-block;">{{ article.user }}</h6>

      <p>{{ article.content }}</p>
    </div>
    
    <p v-if="error !== ''" style="color: red;">{{ error }}</p>

    <p v-if="loading">Loading...</p>
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
      loading: false
    }
  },
  async mounted () {
    await this.loadArticles()
  },
  methods: {
    async loadArticles(){
      this.loading = true
      this.error = ''
      
      try {
        const response = await axios.get(`http://localhost/backend/api/articles`)

        if (response && response.data) {
          const articles = response.data.data
          this.articles = articles ? articles : []
        }
      } catch (e) {
        this.error = e
      } finally {
        this.loading = false
      }
    }
  }
}
</script>

<style scoped>
</style>
