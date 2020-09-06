import Vue from 'vue'
import VueMq from 'vue-mq'

Vue.use(VueMq, {
  breakpoints: {
    sm: 1049,
    lg: Infinity,
  }
})

export default{
  VueMq
}