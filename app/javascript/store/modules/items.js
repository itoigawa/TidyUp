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
  },
  updateItem: (state, updateItem) => {
    const index = state.items.findIndex(item => {
      return item.id == updateItem.id
    })
    state.items.splice(index, 1, updateItem)
  },
  deleteItem: (state, deleteItem) => {
    state.items = state.items.filter(item => {
      return item.id != deleteItem.id
    })
  },
}

const actions = {
  fetchItems({ commit }){
    axios.get('items')
      .then(res=> {
        commit('setItems', res.data)
      })
      .catch(err => console.log(err.response));
  },
  createItem({ commit }, formData) {
    return axios.post('items', formData)
      .then(res => {
        commit('addItem', res.data)
      })
  },
  updateItem({ commit }, formData) {
    return axios.patch(`items/${formData.id}`, formData)
      .then(res => {
        commit('updateItem', res.data)
      })
  },
  deleteItem({ commit }, item) {
    return axios.delete(`items/${item.id}`)
      .then(res => {
        commit('deleteItem', res.data)
      })
  },
  fetchNotWearingItems({ commit }, item) {
    axios.get('items/delete_list')
      .then(res => {
        commit('setItems', res.data)
      })
      .catch(err => console.log(err.response))
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}

