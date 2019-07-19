
import Vue from 'vue'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App)
  }).$mount()
  let main = document.getElementById("main-container")
  main.appendChild(app.$el)
})