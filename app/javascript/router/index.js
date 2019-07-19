import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from '../components/Dashboard'
import Uploader from '../components/Uploader'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/Dashboard',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/Uploader',
      name: 'Uploader',
      component: Uploader
    }
  ]
})