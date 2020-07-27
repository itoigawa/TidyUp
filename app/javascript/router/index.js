import Vue from 'vue'
import Router from 'vue-router'
import ItemIndex from 'pages/item/index.vue'
import UserRoutes from './user-routes'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: ItemIndex,
      name: 'ItemIndex'
    },
    { ...UserRoutes }
  ],
})

export default router