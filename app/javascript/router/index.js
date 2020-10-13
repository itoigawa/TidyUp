import Vue from 'vue'
import Router from 'vue-router'
import store from '../store'

import ItemIndex from '../pages/item/index'
import RegisterIndex from '../pages/register/index'
import LoginIndex from '../pages/login/index'
import DeleteListIndex from '../pages/delete_list/index'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/items',
      component: ItemIndex,
      name: 'ItemIndex',
      meta: { requiredAuth: true },
    },
    {
      path: '/register',
      component: RegisterIndex,
      name: 'RegisterIndex',
    },
    {
      path: '/login',
      component: LoginIndex,
      name: 'LoginIndex',
    },
    {
      path: '/delete-list',
      component: DeleteListIndex,
      name: 'DeliteListIndex'
    }
  ],
})

router.beforeEach((to, from, next) => {
  store.dispatch('users/fetchAuthUser').then((authUser) => {
    if (to.matched.some(record => record.meta.requiredAuth) && !authUser) {
      next({ name: 'LoginIndex' });
    } else {
      next();
    }
  })
});

export default router