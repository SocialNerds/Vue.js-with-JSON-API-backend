import Vue from 'vue'
import VueRouter from 'vue-router'

import axios from 'axios'

import App from './App.vue'
import NewArticle from '@/components/NewArticle'
import ViewAll from '@/components/ViewAll'


Vue.use(VueRouter)

Vue.config.productionTip = false

axios.interceptors.request.use(function (config) {
  if (!config.headers.Authorization) {
    const auth = 'YWRtaW46MTIzNDU2'// obtain cached token

    if (auth) {
      config.headers.Authorization = `Basic ${auth}`
      config.headers['Content-Type'] = 'application/vnd.api+json'
      config.headers['Accept'] = 'application/vnd.api+json'
    }
  }

  return config
}, function (error) {
  return Promise.reject(error);
});

const routes = [
  { path: '/', component: ViewAll },
  { path: '/view', component: ViewAll },
  { path: '/new', component: NewArticle }
]

const router = new VueRouter({
  routes
})

new Vue({
  render: h => h(App),
  router
}).$mount('#app')
