import axios from '../../plugins/axios';

const state = {
  items: []
}

const getters = {
  items: state => state.items
}

const mutations = {
  setItems: (state, items) => {
    state.items = items
  },
  addItem: (state, item) => {
    state.items.push(item)
  }
}

const actions = {
  fetchItems({ commit }){
    axios.get('items')
      .then(res=> {
        commit('setItems', res.data)
      })
      .catch(err => console.log(err.response));
  },
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

