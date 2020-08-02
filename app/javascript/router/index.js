import Vue from 'vue'
import Router from 'vue-router'
import ItemIndex from 'components/item/Index'
import ItemRoutes from './item-routes'
import UserSessionRoutes from './user_session-routes'
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
    { ...ItemRoutes },
    { ...UserSessionRoutes },
    { ...UserRoutes },
  ],
})

export default router