<template>
<div>
  <router-view />
  <TheFooter />
</div>
</template>

<script>
import TheFooter from 'components/shared/TheFooter'

export default {
  components: {
    TheFooter
  }
}
</script>