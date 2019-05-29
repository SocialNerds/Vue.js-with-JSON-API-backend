<template>
  <div>
    <input v-model="article.content" placeholder="Article Title">
    <input v-model="article.title" placeholder="Article Content">

    <button v-if="!loading" @click="newArticle">Submit</button>

    <p v-if="error !== ''" style="color: red;">{{ error }}</p>
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
        const payload = await this.makePayload()

        // eslint-disable-next-line
        console.log(payload)

        await axios.post('http://localhost/backend/api/articles', payload)
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
        if (response && response.data && response.data.data) {
          const firstAuthor = response.data.data[0]

          if (firstAuthor) {
            return firstAuthor.id
          }
        }
      } catch (e) {
        // eslint-disable-next-line
        return undefined
      }
    },
    backToViewAllArticles () {
      this.$router.push('/')
    }
  }
}
</script>

<style scoped>
</style>
