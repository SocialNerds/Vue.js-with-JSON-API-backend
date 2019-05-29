<template>
  <div>
    <input :model="article.content" placeholder="Article Title">
    <input :model="article.title" placeholder="Article Content">

    <button @click="newArticle">Submit</button>

    <p v-if="error !== ''">{{ error }}</p>
    <p v-if="loading">Loading...</p>
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
        await axios.post('http://localhost/new', this.makePayload())
        this.backToViewAllArticles()
      } catch (e) {
        this.error = e
      }

      this.loading = false
    },
    async makePayload () {
      const uid = await this.getUid()
      return {
        data: {
          type: 'articles',
          attributes: {
            title: this.article.title,
            body: {
              value: this.article.content,
              format: 'plain_text'
            }
          },
          relationships: {
            author: {
              data: {
                type: 'authors',
                id: uid
              }
            }
          }
        }
      }
    },
    async getUid () { // return first author id
      try {
        const response = await axios.get('http://localhost/backend/api/authors')
        if (response && response.data && response.data[0]) {
          const firstAuthor = response.data.data[0]

          if (firstAuthor.id) {
            return firstAuthor.id
          }
        }
      } finally {
        // eslint-disable-next-line
        return undefined
      }
    },
    backToViewAllArticles () {
      this.$router.go('/view')
    }
  }
}
</script>

<style scoped>
</style>
