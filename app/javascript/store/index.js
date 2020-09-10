import Vue from 'vue';
import Vuex from 'vuex';
import items from './modules/items';
import users from './modules/users';

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    items,
    users
  }
})