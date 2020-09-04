import axios from '../../plugins/axios';

const state = {
  items: []
}

const getters = {
  items: state => state.items
}

const mutations = {
  addItem: (state, item) => {
    state.items.push(item)
  }
}

const actions = {
  createItem({ commit }, item) {
    return axios.post('items', item)
      .then(res => {
        commit('addItem', res.data)
      })
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}

