import Vue from 'vue'
import Router from 'vue-router'
import ItemIndex from 'components/item/Index.vue'
import ItemRoutes from './item-routes'
import UserRoutes from './user-routes'
import UserSessionRoutes from './user_session-routes'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: ItemIndex,
      name: 'ItemIndex'
    },
    { ...UserRoutes },
    { ...UserSessionRoutes },
    { ...ItemRoutes }
  ],
})

export default router