
import Vue from 'vue'
import App from '../app.vue'
import routes from '../routes'
import VueRouter from 'vue-router'
import VueSweetalert2 from 'vue-sweetalert2'

import 'sweetalert2/dist/sweetalert2.min.css'
Vue.use(VueRouter)
Vue.use(VueSweetalert2)
const router = new VueRouter({
  routes: routes
}); 
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App),
    router: router
  }).$mount()
  let main = document.getElementById("main-container")
  main.appendChild(app.$el)
})