<template>
<div>
  <router-view />
  <TheFooter />
</div>
</template>

<script>
import TheFooter from 'components/shared/TheFooter.vue'

export default {
  components: {
    TheFooter
  }
}
</script>