<template>
  <div>
    <h1>Loaded {{ articles.length }} Articles</h1>

    <div v-for="(article, index) in articles" :key="`article-${index}`" style="padding: 50px;">
      <hr />
      <div style="display: flex; align-items: center; margin: auto;">
        <h2>{{ article.attributes.title }}</h2> 
        <h6 style="margin-left:20px; font-size: 8px;">{{ article.relationships.author.data.id }}</h6>
      </div>

      <div style="display: flex; align-items: center; margin: auto;">
        <p>{{ article.attributes.body.value }}</p>
      </div>
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

          // eslint-disable-next-line
          console.log(articles)
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
