<template>
  <div>
    <input :model="article.content" placeholder="Article Title">
    <input :model="article.title" placeholder="Article Content">

    <button @click="newArticle">Submit</button>

    <p :if="error !== ''">{{ error }}</p>
    <p :if="loading">Loading...</p>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'NewArticle',
  data () {
    return {
      article: {
        title: '',
        content: '',
      },
      error: '',
      loading: false
    }
  },
  methods: {
    async newArticle () {
      this.loading = false
      this.error = ''
      try {
        await axios.post('http://localhost/new', article)
        this.backToViewAllArticles()
      } catch (e) {
        this.error = e
      }

      this.loading = false
    },
    backToViewAllArticles () {
      this.$router.go('/view')
    }
  }
}
</script>

<style scoped>
</style>
